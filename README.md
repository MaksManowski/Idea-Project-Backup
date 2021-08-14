# Idea-Project-Backup
A batch file that can be used to save file backups of idea projects (Or any directory based save system).
This is made for Windows and has been tested on Windows 10.

##How to setup
1. Create a new text file somewhere on your computer (Not on the desktop if you are planning to).
2. Rename the file so that it ends in .bat
3. Copy and paste the text inside Backup.bat into your file.
4. Edit the top two lines after echo off, setting from where you want to copy to where. (Google drive is recommended)
5. Save it and close the file.
6. Right click on it and create a shortcut.
7. On the shortcut, right click it and select Properties, then advanced and select "Run as Administrator". This will make it so you do not have to right click and run the bat as admin.

##Setting up auto boot
1. Open gpedit.msc (You can just type it into command prompt)
2.  Click through: User Configuration > Windows Settings > Scripts > Logon
3.  Click Add and then select your where you put your script.
4.  Hit OK!
