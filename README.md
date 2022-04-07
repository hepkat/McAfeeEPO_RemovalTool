# McAfeeEPO_RemovalTool
AutoHotkey Script to uninstall McAfee EPO

I made this script to uninstall McAfee EPO from machines that were in my organization's domain. Our McAfee license expired (expected) and some remnant machines still had the EPO installed and we could no longer uninstall it through the EPO console online (no license). So I made this autohotkey script (so it can be compiled into a nice EXE if needed). I've removed our client password, you can fill it in with the one you use at your org. Or if you don't have one, just remove the password command. The autohotkey logic is pretty simple to understand. The McAfee installer/uninstaller logic is also pretty self-explanitory. So if your EPO has more or less McAfee components installed you should be able to decipher what changes you need to make.

`McAfee.Removal.Tool.ahk` has a GUI progress bar and confirmation dialogs about the install existing or not and uninstall being complete.

`SILENT.McAfee.Removal.Tool.ahk` has no GUI.

Here is a screenshot of the about information of the McAfee I was working with at the time of this script's creation:
![McAfeeEPO](https://i.imgur.com/uGn5vHe.png)
#
The script automatically attempts to elevate. So no need to "Run As Admin."

![image](https://user-images.githubusercontent.com/25138984/162277498-b4886bc0-5de9-4208-a449-913398e4f1e7.png)
#
The progress bar of the uninstaller when it first starts (non-silent version).

![image](https://user-images.githubusercontent.com/25138984/162277606-01c52551-ebdd-402e-93fd-3fe6e33449f7.png)
#
Progressing the uninstall (non-silent version).

![image](https://user-images.githubusercontent.com/25138984/162277928-d4a24608-75f6-49d1-ab59-cc10ded44f8e.png)
#
Uninstall finishing (non-silent version).

![image](https://user-images.githubusercontent.com/25138984/162278015-d9ea549f-8488-4834-8e0b-9c939a0df330.png)
#
Uninstall is completed (non-silent version).

![image](https://user-images.githubusercontent.com/25138984/162278082-3f2f01c8-8eff-4812-86c1-a8949cd9cf89.png)
#
You won't see any of that GUI if you use the `SILENT.McAfee.Removal.Tool.ahk` script instead.
