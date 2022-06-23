
# Regional settings

Set-Culture en-AU
Set-WinSystemLocale -SystemLocale en-AU
Set-WinUILanguageOverride -Language en-AU
Set-WinUserLanguageList en-AU -Force
Set-WinHomeLocation -GeoId 12


# .NET Framework (3.5)
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3"

#  session timeouts
# Applied through Group Policy for


