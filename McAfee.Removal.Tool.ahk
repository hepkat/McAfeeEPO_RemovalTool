#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; If the script is not elevated, relaunch as administrator and kill current instance:

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

;Check if Security Platform (the last piece of McAfee) is still installed.
IfExist C:\Program Files\McAfee\Endpoint Security\Endpoint Security Platform\RepairCache\CCUninst.exe
{

Gui +LastFound +AlwaysOnTop -Caption +ToolWindow +Border
Gui, Font, s32
Gui, Add, Text, Center vText2, McAfee EPO Uninstall
Gui, Add, Progress, vProgress -Smooth w400 h20 cDefault Disabled  ;Progress bar starting for the uninstall script.
Gui, Font, s11
Gui, Add, Text, vText1 w400, Uninstalling McAfee Agent ...   
Gui, show, AutoSize

;If it is, start at the top of products to uninstall, the first being McAfee Agent
;Uninstall McAfee Agent x64_OS
IfExist C:\Program Files\McAfee\Agent\x86\FrmInst.exe
{
	Run, C:\Program Files\McAfee\Agent\x86\FrmInst.exe /forceuninstall /silent ;Uninstalls McAfee Agent.
}
else {
	; Do nothing.
}

Loop
While FileExist("C:\Program Files\McAfee\Agent\x86\FrmInst.exe")
{
	Sleep, 5000 ;wait 5 seconds
}
until !FileExist("C:\Program Files\McAfee\Agent\x86\FrmInst.exe")

;Uninstall McAfee Agent x86_OS
IfExist C:\Program Files\McAfee\Agent\FrmInst.exe
{
	Run, C:\Program Files\McAfee\Agent\FrmInst.exe /forceuninstall /silent ;Uninstalls McAfee Agent.
}
else {
	; Do nothing.
}

Loop
While FileExist("C:\Program Files\McAfee\Agent\FrmInst.exe")
{
	Sleep, 5000 ;wait 5 seconds
}
until !FileExist("C:\Program Files\McAfee\Agent\FrmInst.exe")

{
WinWaitClose, ahk_exe c:\windows\system32\msiexec.exe
GuiControl,, Progress, +20
GuiControl, Text, Text1, Uninstalling McAfee Web Control ...
;Uninstall McAfee Web Control for x64 systems.
IfExist C:\Program Files (x86)\McAfee\Endpoint Security\Web Control\RepairCache\setupWC.exe
{
	Run, C:\Program Files (x86)\McAfee\Endpoint Security\Web Control\RepairCache\setupWC.exe /x /removeespsynchronously /PASSWORD=REPLACE_THIS_WITH_YOUR_MCAFEE_CLIENT_PASSWORD
}
else {
;Uninstall McAfee Web Control for x86 systems.
IfExist C:\Program Files\McAfee\Endpoint Security\Web Control\RepairCache\setupWC.exe
{
	Run, C:\Program Files\McAfee\Endpoint Security\Web Control\RepairCache\setupWC.exe /x /removeespsynchronously /PASSWORD=REPLACE_THIS_WITH_YOUR_MCAFEE_CLIENT_PASSWORD
}
else {
; Do nothing.
}
}
}

Loop
While FileExist("C:\Program Files (x86)\McAfee\Endpoint Security\Web Control\RepairCache\setupWC.exe")
{
	Sleep, 5000 ;wait 5 seconds
}
until !FileExist("C:\Program Files (x86)\McAfee\Endpoint Security\Web Control\RepairCache\setupWC.exe")
{
WinWaitClose, ahk_exe c:\windows\system32\msiexec.exe
GuiControl,, Progress, +20
GuiControl, Text, Text1, Uninstalling McAfee Firewall ...
;GPUPDATE and then uninstall McAfee Firewall.
IfExist C:\Program Files\McAfee\Endpoint Security\Firewall\RepairCache\SetupFW.exe
{
	Run, CMD.exe /c echo n | gpupdate /force /wait:0
	WinWait, ahk_exe cmd.exe
	WinHide, ahk_exe cmd.exe
	WinWaitClose, ahk_exe cmd.exe
	Run, C:\Program Files\McAfee\Endpoint Security\Firewall\RepairCache\SetupFW.exe /x /removeespsynchronously /PASSWORD=REPLACE_THIS_WITH_YOUR_MCAFEE_CLIENT_PASSWORD
}
else {
; Do nothing.
}
}

Loop
While FileExist("C:\Program Files\McAfee\Endpoint Security\Firewall\RepairCache\SetupFW.exe")
{
	Sleep, 5000 ;wait 5 seconds
}
until !FileExist("C:\Program Files\McAfee\Endpoint Security\Firewall\RepairCache\SetupFW.exe")
{
WinWaitClose, ahk_exe c:\windows\system32\msiexec.exe
GuiControl,, Progress, +20
GuiControl, Text, Text1, Uninstalling McAfee Threat Prevention ...
;Uninstall McAfee Threat Prevention.
IfExist C:\Program Files\McAfee\Endpoint Security\Threat Prevention\RepairCache\setupTP.exe
{
	Run, C:\Program Files\McAfee\Endpoint Security\Threat Prevention\RepairCache\setupTP.exe /x /removeespsynchronously /PASSWORD=REPLACE_THIS_WITH_YOUR_MCAFEE_CLIENT_PASSWORD
}
else {
; Do nothing.
}
}

Loop
While FileExist("C:\Program Files\McAfee\Endpoint Security\Threat Prevention\RepairCache\setupTP.exe")
{
	Sleep, 5000 ;wait 5 seconds
}
until !FileExist("C:\Program Files\McAfee\Endpoint Security\Threat Prevention\RepairCache\setupTP.exe")
{
WinWaitClose, ahk_exe c:\windows\system32\msiexec.exe
GuiControl,, Progress, +20
GuiControl, Text, Text1, Uninstalling McAfee Security Platform ...
;Uninstall McAfee Security Platform.
IfExist C:\Program Files\McAfee\Endpoint Security\Endpoint Security Platform\RepairCache\CCUninst.exe
{
	Run, C:\Program Files\McAfee\Endpoint Security\Endpoint Security Platform\RepairCache\CCUninst.exe /quiet /norestart
	WinWait, ahk_exe C:\Program Files\McAfee\Endpoint Security\Endpoint Security Platform\RepairCache\CCUninst.exe
	WinHide, ahk_exe C:\Program Files\McAfee\Endpoint Security\Endpoint Security Platform\RepairCache\CCUninst.exe
}
else {
; Do nothing.
}
}

WinWaitClose, ahk_exe C:\Program Files\McAfee\Endpoint Security\Endpoint Security Platform\RepairCache\CCUninst.exe
GuiControl,, Progress, +20
GuiControl, Text, Text1, Uninstall completing ...
Sleep, 3000 ;Wait 3 seconds.
WinWaitClose, ahk_exe c:\windows\system32\msiexec.exe
Gui, Destroy
GuiClose:
	msgbox, 0, Complete!, McAfee EPO has been uninstalled!
	ExitApp
return
}
else {
Msgbox, 0, Error, McAfee EPO is not installed on this system.
ExitApp
}