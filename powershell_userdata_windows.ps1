<powershell>
Write-Host("Welcome to kumar training")

if(Test-Path -Path "C:\kumar")
{
	write-host("Folder exists")
}
else
{
	New-Item -Path "c:\" -Name "kumar" -ItemType "Directory"
}
$awscliurl = "https://s3.amazonaws.com/aws-cli/AWSCLI64PY3.msi"
$output = "c:\kumar\AWSCLI64PY3.msi"
Invoke-WebRequest -Uri $awscliurl -OutFile $output
$pythonurl = "https://www.python.org/ftp/python/3.8.1/python-3.8.1-amd64.exe"
$output = "c:\kumar\python-3.8.1-amd64.exe"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $pythonurl -OutFile $output
New-Item -Path C:\kumar -Name "kumar.txt" -ItemType "file" -Value "Welcome to AWS world."
Write-Host("Program ended")
</powershell>
