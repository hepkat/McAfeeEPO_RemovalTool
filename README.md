# McAfeeEPO_RemovalTool
AutoHotkey Script to uninstall McAfee EPO

I made this script to uninstall McAfee EPO from machines that were in my organization's domain. Our McAfee license expired (expected) and some remnant machines still had the EPO installed and we could no longer uninstall it through the EPO console online (no license). So I made this autohotkey script (so it can be compiled into a nice EXE if needed). I've removed our client password, you can fill it in with the one you use at your org. Or if you don't have one, just remove the password command. The autohotkey logic is pretty simple to understand. The McAfee installer/uninstaller logic is also pretty self-explanitory. So if your EPO has more or less McAfee components installed you should be able to decipher what changes you need to make.

`McAfee.Removal.Tool.ahk` has a GUI progress bar and confirmation dialogs about the install existing or not and uninstall being complete.
`SILENT.McAfee.Removal.Tool.ahk` has no GUI.

Here is a screenshot of the about information of the McAfee I was working with at the time of this script's creation:
![McAfeeEPO](https://i.imgur.com/uGn5vHe.png)
