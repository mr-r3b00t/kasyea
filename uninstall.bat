REM Uninstall Kasyea by mRr3b00t
REM use at own risk - i wrote this without the software so used OSINT only


REM Batch file for automated 'silent' uninstall and then forced service stop
REM https://www.kazmarek.com/manually-uninstall-kaseya-agent/
REM https://helpdesk.kaseya.com/hc/en-gb/articles/229039368-Uninstall-an-Agent-Via-Command-Line
REM CHeck if running as admin if not quit
net.exe session 1>NUL 2>NUL || (Echo This script requires elevated rights. & Exit /b 1)

REM Uninstall agent via installer
"C:\Program Files (x86)\Kaseya\TESTSS38184348680695\KASetup.exe" /s /r /g TESTSS38184348680695 /l "%TEMP%\kasetup.log"

REM Disable services (brute force)
net stop "Kaysea Agent"

sc config "Kaysea Agent" start= disabled
sc stop "Kaysea Agent"
