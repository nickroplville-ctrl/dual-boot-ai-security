GUIDE FOR BEGINNERS

How to do everything from scratch if you understand nothing
Part 1. Preparation
Step 1. Check free disk space
Open File Explorer (yellow folder on taskbar or Win + E).
Click This PC on the left.
Find drive C:. Below it shows how much is free.
You need at least 400 GB free. If less — free up space (delete unnecessary files, programs, empty Recycle Bin).
Step 2. Download Windows ISO
Open browser (Chrome, Edge, Firefox).
In address bar type: microsoft.com/software-download/windows11
Press Enter.
Scroll down to Download Windows 11 Disk Image (ISO).
In dropdown select Windows 11.
Click Download button.
Select language Russian → Confirm.
Click 64-bit Download button.
File is ~5 GB. Wait for download to finish. Don't close browser.
Step 3. Download Rufus
In new browser tab type: rufus.ie
Press Enter.
Scroll down to Download section.
Click link Rufus 4.x (latest version).
File rufus-4.x.exe will download. Don't run yet.
Step 4. Prepare USB flash drive
Take USB flash drive minimum 8 GB.
Everything will be erased. Copy needed files to computer or another drive.
Insert flash drive into USB port.
Part 2. Writing Windows to USB
Step 5. Launch Rufus
Open Downloads folder (in File Explorer on left).
Find file rufus-4.x.exe.
Double-click it.
Windows may ask permission — click Yes.
Rufus window opens.
Step 6. Configure Rufus
At top, in Device line, your flash drive should appear. If not — select from list.
Click SELECT button (right of "Boot selection").
File selection window opens. Find downloaded Windows 11 ISO (usually in Downloads folder, name like Win11_Russian_x64v1.iso).
Select file → click Open.
In Partition scheme line select GPT (if modern computer, 2015+).
In Target system line select UEFI (non-CSM).
Leave everything else as is.
Click START button at bottom.
Warning appears that flash drive will be wiped. Click OK.
Wait. Progress bar turns green. When reaches 100% and says Ready — close Rufus.
Flash drive is ready. Don't remove it.
Part 3. Shrinking C: Drive
Step 7. Open Disk Management
Press Win + X on keyboard.
Menu appears in bottom-left corner. Click Disk Management.
Window opens with rectangles — these are your disks.
Step 8. Shrink C: drive
Find rectangle labeled (C:). This is your main drive.
Right-click on it.
In menu select Shrink Volume....
Window appears. In Enter the amount of space to shrink in MB line type: 400000.
This is roughly 400 GB. If you want different value — enter your own (1 GB = 1024 MB).
Click Shrink button.
Wait. May take 5-15 minutes.
After shrinking, black bar appears labeled Unallocated. This is free space for Windows AI.
Step 9. Create new partition
Right-click on black "Unallocated" bar.
Select New Simple Volume....
Wizard opens. Click Next.
Leave size as is (all available). Click Next.
Drive letter can stay default (e.g., D:). Click Next.
File system select NTFS. Click Next.
Click Finish.
Black bar turns blue with drive letter. Partition is ready.
Part 4. Enabling BitLocker
Step 10. Open BitLocker
Press Win + S (search).
Start typing: bitlocker.
In results click Manage BitLocker.
Control Panel window opens.
Step 11. Enable BitLocker for C: drive
Find drive Operating system (C:).
Click link Turn on BitLocker.
Window appears for choosing recovery key save method. Select Save to your Microsoft account (easiest).
Click Next.
Select Enter a password at startup.
Create strong password (minimum 8 characters, letters + numbers). Write it on paper and hide it.
Enter password twice. Click Next.
Select Encrypt only used disk space (faster). Click Next.
Select New encryption mode (AES-256). Click Next.
Click Start encryption.
Wait. May take 30 minutes to several hours depending on disk size.
After completion drive C: is protected. At every boot Windows Personal will ask for password.
Part 5. Installing Windows AI
Step 12. Reboot computer from USB
Windows USB flash drive should be inserted.
Click Start → Power → Restart.
Immediately after restart begins, start rapidly pressing F12 key (or F2, Del, Esc — depends on computer manufacturer).
Boot Menu or BIOS appears.
If Boot Menu — select your flash drive (usually named USB-HDD or Kingston/SanDisk). Press Enter.
If BIOS — find Boot section, put flash drive first, press F10 (Save and exit).
Step 13. Install Windows AI
Windows setup screen appears. Select language Russian → Next.
Click Install.
Enter product key (if have) or click I don't have a product key.
Select Windows version (usually Windows 11 Home or Pro). Click Next.
Accept license agreement → Next.
Select Custom: Install Windows only (advanced).
Partition list appears. Find partition you created earlier (by size ~400 GB, unallocated area or new partition).
Select it → click Next.
If asks about formatting — click OK.
Installation begins. Wait 15-30 minutes. Computer may restart several times.
Step 14. Configure Windows AI
After installation, setup screen appears.
Select country Russia → Yes.
Select keyboard layout → Yes.
Skip adding second layout → Skip.
Connect to Wi-Fi (if needed) or click I don't have internet.
Enter computer name: Windows-AI (or any other).
Create user account. Name: User (or any). Password: create simple one (this password is not critical, no personal data here).
Select privacy settings — disable everything extra (ads, tracking).
Wait for setup to complete.
Part 6. Boot Menu
Step 15. Check boot menu
After Windows AI setup, restart computer: Start → Power → Restart.
When turning on, black screen with menu appears:
Windows Personal (or Windows 11)
Windows AI (or Windows 11, second entry)
Select with arrow keys on keyboard → press Enter.
If selected Windows Personal — enter BitLocker password.
If selected Windows AI — boots without password.
Part 7. Securing Windows AI
Step 16. UAC at maximum
In Windows AI press Win + S → start typing uac.
Click Change User Account Control settings.
Move slider all the way up — Always notify.
Click OK.
Restart computer.
Step 17. Disable Windows Defender shutdown
Press Win + R.
In window type: gpedit.msc → click OK.
If Windows says file not found (gpedit.msc missing in Home edition), use alternative:
Open Registry Editor: Win + R → regedit → OK.
Navigate: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
If Windows Defender folder doesn't exist — create: right-click Microsoft → New → Key → name Windows Defender.
Inside right-click → New → DWORD (32-bit) Value → name DisableAntiSpyware.
Double-click → value 0 → OK.
Restart computer.
Step 18. Disk image (backup)
In Windows AI open browser.
Type: macrium.com/reflectfree → download Macrium Reflect Free.
Install: double-click file → Next → Next → Install.
Launch program.
Click Create a backup → Image this disk.
Select Windows AI disk.
Click link below disk Select a location for your image.
Select external drive (USB flash/external HDD) or another partition.
Click Next → Finish.
Wait. Image will be 20-40 GB.
If Windows AI breaks — boot from Macrium Rescue CD (created in program) and restore image in 20 minutes.
Part 8. Installing AI Agent
Step 19. Install required programs
Git: git-scm.com → download → install (all defaults).
Node.js: nodejs.org → download LTS version → install.
Python: python.org → Downloads → Windows → Python 3.11+ → install (check Add Python to PATH).
Step 20. Install Hermes
Open Terminal or PowerShell (right-click Start → Terminal (admin)).
Type:
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
Wait for installation to complete.
Type: hermes setup → follow instructions.
Type: hermes model → select model (Claude, GPT-4o, local).
Enter API key (if using cloud model).
Step 21. Configure memory and skills
Open File Explorer → user folder → .hermes.
Create file SOUL.md — write who the agent is (e.g., "You are experienced programmer, help write Python code").
Create file USER.md — write about yourself ("I am beginner developer, prefer simple solutions").
Create folder skills → inside file deploy.md — describe your project deploy process.
To add skills from repository: hermes skills tap add nousresearch/skills.
Step 22. Install OpenClaw (alternative)
In Terminal type:
npm install -g openclaw@latest
Then: openclaw onboard --install-daemon
Configure openclaw.json in user folder.
For memory: openclaw plugins install @mem0/openclaw-mem0.
Part 9. Work Rules
What to do	How to do
Work with AI agent	Boot Windows AI
Banking, personal, games	Boot Windows Personal
Do NOT enter BitLocker password in Windows AI	This opens access to your data
Do NOT save passwords in Windows AI browser	No personal accounts there
Update Windows AI	Every 2 months manually or auto security updates
Make disk image	Once after setup. Then after major changes.
Part 10. If Something Goes Wrong
Boot menu doesn't appear
Boot into Windows Personal → Win + R → msconfig → Boot tab → check both systems are in list.
Hermes won't install
Check Python, Node.js, Git are installed. In terminal type: python --version, node --version, git --version.
BitLocker asks for recovery key
Log into Microsoft account on another device → Devices section → find your computer → Manage BitLocker keys.
Windows AI is broken
Boot from Macrium Reflect Rescue flash drive → select image → restore.
Done. Your AI agent is isolated. Personal data is secure.
