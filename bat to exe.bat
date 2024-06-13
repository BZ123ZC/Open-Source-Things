@echo off

rem Create the source batch file
echo @echo off > script.bat
echo echo Hello, this is a test batch script. >> script.bat
echo pause >> script.bat

rem Create the configuration file for IExpress
(
echo [Version]
echo Class=IEXPRESS
echo SEDVersion=3
echo [Options]
echo PackagePurpose=InstallApp
echo ShowInstallProgramWindow=0
echo HideExtractAnimation=1
echo UseLongFileName=1
echo InsideCompressed=0
echo CAB_FixedSize=0
echo CAB_ResvCodeSigning=0
echo RebootMode=N
echo InstallPrompt=%InstallPrompt%
echo DisplayLicense=%DisplayLicense%
echo FinishMessage=%FinishMessage%
echo TargetName=%TargetName%
echo FriendlyName=%FriendlyName%
echo AppLaunched=%AppLaunched%
echo PostInstallCmd=%PostInstallCmd%
echo AdminQuietInstCmd=%AdminQuietInstCmd%
echo UserQuietInstCmd=%UserQuietInstCmd%
echo SourceFiles=SourceFiles
echo [Strings]
echo InstallPrompt=
echo DisplayLicense=
echo FinishMessage=
echo TargetName=install
echo FriendlyName=Installation Program
echo AppLaunched=script.bat
echo PostInstallCmd=<None>
echo AdminQuietInstCmd=
echo UserQuietInstCmd=
)>config.txt

rem Package the script into an executable using IExpress
iexpress /n config.txt

rem Clean up temporary files
del script.bat config.txt
