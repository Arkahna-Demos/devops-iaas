# SQL Managed Client
# Start-Process msiexec.exe -ArgumentList "/i c:\dev\clients\mercycare\procurards\dependencies\sqlncli.msi /quiet /qn IACCEPTSQLNCLILICENSETERMS=YES /log sqlncliout.txt" -Wait -NoNewWindow
New-Item -Path 'c:\temp\' -ItemType Directory -Force | Out-Null
Copy-Item z:\sqlncli.msi c:\temp\

Start-Process msiexec.exe -ArgumentList "/i c:\temp\sqlncli.msi /quiet /qn IACCEPTSQLNCLILICENSETERMS=YES /log sqlncliout.txt" -Wait -NoNewWindow
# .NET Framework (3.5)
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3"