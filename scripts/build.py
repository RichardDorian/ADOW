import xml.etree.ElementTree as ET
from os import listdir, makedirs, path

input = "src/autounattend.xml"
output = "build"

if not path.exists(output):
  makedirs(output)

ET.register_namespace("", "urn:schemas-microsoft-com:unattend")
ET.register_namespace("wcm", "http://schemas.microsoft.com/WMIConfig/2002/State")

xml = ET.parse(input)
xml.getroot().set("xmlns:wcm", "http://schemas.microsoft.com/WMIConfig/2002/State")

orders = {
  "windowsPE": 1,
  "specialize": 1
}

def synchronous_command(root, order_value, path_value):
  command = ET.SubElement(root, "RunSynchronousCommand")
  command.set("wcm:action", 'add')

  order = ET.SubElement(command, "Order")
  order.text = str(order_value)

  path = ET.SubElement(command, "Path")
  path.text = path_value

windowsPE = listdir("src/windowsPE")
root = xml.find(".//{urn:schemas-microsoft-com:unattend}settings[@pass='windowsPE']/{urn:schemas-microsoft-com:unattend}component[@name='Microsoft-Windows-Setup']/{urn:schemas-microsoft-com:unattend}RunSynchronous")
for file_path in windowsPE:
  with open("src/windowsPE/" + file_path) as f:
    file = f.read()

  lines = file.split("\n")
  for line in lines:
    line = line.strip()
    if len(line) > 0:
      synchronous_command(root, orders["windowsPE"], f'cmd.exe /c ">>"X:\\{file_path}" echo {line}"')
      orders["windowsPE"] += 1
  
  synchronous_command(root, orders["windowsPE"], f'cmd.exe /c "start /MIN x:\\{file_path}"')
  orders["windowsPE"] += 1
# synchronous_command(root, orders["windowsPE"], 'cmd.exe')

files = ET.SubElement(xml.getroot(), "Files")
ET.SubElement(files, "ExtractScript").text = "param( [xml] $Document ); $scriptsDir = 'C:\\Windows\\Setup\\Scripts\\'; foreach( $file in $Document.unattend.Files.File ) { $path = [System.Environment]::ExpandEnvironmentVariables( $file.GetAttribute( 'path' ) ); if( $path.StartsWith( $scriptsDir ) ) { mkdir -Path $scriptsDir -ErrorAction 'SilentlyContinue'; } $encoding = switch( [System.IO.Path]::GetExtension( $path ) ) { { $_ -in '.ps1', '.xml' } { [System.Text.Encoding]::UTF8; } { $_ -in '.reg', '.vbs', '.js' } { [System.Text.UnicodeEncoding]::new( $false, $true ); } default { [System.Text.Encoding]::Default; } }; [System.IO.File]::WriteAllBytes( $path, ( $encoding.GetPreamble() + $encoding.GetBytes( $file.InnerText.Trim() ) ) ); }"
def add_file(path, content):
  el = ET.SubElement(files, "File")
  el.set("path", path)
  el.text = content

specialize = listdir("src/specialize")
root = xml.find(".//{urn:schemas-microsoft-com:unattend}settings[@pass='specialize']/{urn:schemas-microsoft-com:unattend}component[@name='Microsoft-Windows-Deployment']/{urn:schemas-microsoft-com:unattend}RunSynchronous")
synchronous_command(root, orders["specialize"], 'powershell.exe -NoProfile -Command "$xml = [xml]::new(); $xml.Load(\'C:\\Windows\\Panther\\unattend.xml\'); $sb = [scriptblock]::Create( $xml.unattend.Files.ExtractScript ); Invoke-Command -ScriptBlock $sb -ArgumentList $xml;"')
orders["specialize"] += 1
for file_path in specialize:
  with open("src/specialize/" + file_path) as f:
    file = f.read()
  add_file(f"%TEMP%\\{file_path}", file)

  command = ""
  if file_path.endswith(".cmd"):
    command = f'cmd.exe /c "%TEMP%\\{file_path}"'
  elif file_path.endswith(".ps1"):
    command = f'powershell.exe -NoProfile -Command "Get-Content -LiteralPath $Env:TEMP\\{file_path} -Raw | Invoke-Expression;"'

  synchronous_command(root, orders["specialize"], command)
  orders["specialize"] += 1
  
# synchronous_command(root, orders["specialize"], 'cmd.exe')

xml.write(output + "/autounattend.xml", encoding="utf-8")