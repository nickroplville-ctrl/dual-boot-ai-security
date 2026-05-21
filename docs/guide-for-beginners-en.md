GUIDE FOR BEGINNERS

## How to do everything from scratch if you understand nothing

---

## Part 1. Preparation

### Step 1. Check free disk space

1. Open **File Explorer** (yellow folder on taskbar or `Win + E`).
2. Click **This PC** on the left.
3. Find drive **C:**. Below it shows how much is free.
4. You need at least **400 GB free**. If less — free up space (delete unnecessary files, programs, empty Recycle Bin).

### Step 2. Download Windows ISO

1. Open browser (Chrome, Edge, Firefox).
2. In address bar type: `microsoft.com/software-download/windows11`
3. Press **Enter**.
4. Scroll down to **Download Windows 11 Disk Image (ISO)**.
5. In dropdown select **Windows 11**.
6. Click **Download** button.
7. Select language **Russian** → **Confirm**.
8. Click **64-bit Download** button.
9. File is ~5 GB. Wait for download to finish. Don't close browser.

### Step 3. Download Rufus

1. In new browser tab type: `rufus.ie`
2. Press **Enter**.
3. Scroll down to **Download** section.
4. Click link **Rufus 4.x** (latest version).
5. File `rufus-4.x.exe` will download. Don't run yet.

### Step 4. Prepare USB flash drive

1. Take USB flash drive minimum **8 GB**.
2. Everything will be erased. Copy needed files to computer or another drive.
3. Insert flash drive into USB port.

---

## Part 2. Writing Windows to USB

### Step 5. Launch Rufus

1. Open **Downloads** folder (in File Explorer on left).
2. Find file **rufus-4.x.exe**.
3. Double-click it.
4. Windows may ask permission — click **Yes**.
5. Rufus window opens.

### Step 6. Configure Rufus

1. At top, in **Device** line, your flash drive should appear. If not — select from list.
2. Click **SELECT** button (right of "Boot selection").
3. File selection window opens. Find downloaded Windows 11 ISO (usually in Downloads folder, name like `Win11_Russian_x64v1.iso`).
4. Select file → click **Open**.
5. In **Partition scheme** line select **GPT** (if modern computer, 2015+).
6. In **Target system** line select **UEFI (non-CSM)**.
7. Leave everything else as is.
8. Click **START** button at bottom.
9. Warning appears that flash drive will be wiped. Click **OK**.
10. Wait. Progress bar turns green. When reaches 100% and says **Ready** — close Rufus.
11. Flash drive is ready. Don't remove it.

---

## Part 3. Shrinking C: Drive

### Step 7. Open Disk Management

1. Press **Win + X** on keyboard.
2. Menu appears in bottom-left corner. Click **Disk Management**.
3. Window opens with rectangles — these are your disks.

### Step 8. Shrink C: drive

1. Find rectangle labeled **(C:)**. This is your main drive.
2. **Right-click** on it.
3. In menu select **Shrink Volume...**.
4. Window appears. In **Enter the amount of space to shrink in MB** line type: `400000`.
5. This is roughly 400 GB. If you want different value — enter your own (1 GB = 1024 MB).
6. Click **Shrink** button.
7. Wait. May take 5-15 minutes.
8. After shrinking, black bar appears labeled **Unallocated**. This is free space for Windows AI.

### Step 9. Create new partition

1. **Right-click** on black "Unallocated" bar.
2. Select **New Simple Volume...**.
3. Wizard opens. Click **Next**.
4. Leave size as is (all available). Click **Next**.
5. Drive letter can stay default (e.g., D:). Click **Next**.
6. File system select **NTFS**. Click **Next**.
7. Click **Finish**.
8. Black bar turns blue with drive letter. Partition is ready.

---

## Part 4. Enabling BitLocker

### Step 10. Open BitLocker

1. Press **Win + S** (search).
2. Start typing: `bitlocker`.
3. In results click **Manage BitLocker**.
4. Control Panel window opens.

### Step 11. Enable BitLocker for C: drive

1. Find drive **Operating system (C:)**.
2. Click link **Turn on BitLocker**.
3. Window appears for choosing recovery key save method. Select **Save to your Microsoft account** (easiest).
4. Click **Next**.
5. Select **Enter a password at startup**.
6. Create strong password (minimum 8 characters, letters + numbers). Write it on paper and hide it.
7. Enter password twice. Click **Next**.
8. Select **Encrypt only used disk space** (faster). Click **Next**.
9. Select **New encryption mode** (AES-256). Click **Next**.
10. Click **Start encryption**.
11. Wait. May take 30 minutes to several hours depending on disk size.
12. After completion drive C: is protected. At every boot Windows Personal will ask for password.

---

## Part 5. Installing Windows AI

### Step 12. Reboot computer from USB

1. Windows USB flash drive should be inserted.
2. Click **Start** → **Power** → **Restart**.
3. Immediately after restart begins, start rapidly pressing **F12** key (or **F2**, **Del**, **Esc** — depends on computer manufacturer).
4. Boot Menu or BIOS appears.
5. If Boot Menu — select your flash drive (usually named USB-HDD or Kingston/SanDisk). Press **Enter**.
6. If BIOS — find Boot section, put flash drive first, press F10 (Save and exit).

### Step 13. Install Windows AI

1. Windows setup screen appears. Select language **Russian** → **Next**.
2. Click **Install**.
3. Enter product key (if have) or click **I don't have a product key**.
4. Select Windows version (usually **Windows 11 Home** or **Pro**). Click **Next**.
5. Accept license agreement → **Next**.
6. Select **Custom: Install Windows only (advanced)**.
7. Partition list appears. Find partition you created earlier (by size ~400 GB, unallocated area or new partition).
8. Select it → click **Next**.
9. If asks about formatting — click **OK**.
10. Installation begins. Wait 15-30 minutes. Computer may restart several times.

### Step 14. Configure Windows AI

1. After installation, setup screen appears.
2. Select country **Russia** → **Yes**.
3. Select keyboard layout → **Yes**.
4. Skip adding second layout → **Skip**.
5. Connect to Wi-Fi (if needed) or click **I don't have internet**.
6. Enter computer name: `Windows-AI` (or any other).
7. Create user account. Name: `User` (or any). Password: create simple one (this password is not critical, no personal data here).
8. Select privacy settings — disable everything extra (ads, tracking).
9. Wait for setup to complete.

---

## Part 6. Boot Menu

### Step 15. Check boot menu

1. After Windows AI setup, restart computer: **Start** → **Power** → **Restart**.
2. When turning on, black screen with menu appears:
  - **Windows Personal** (or Windows 11)
  - **Windows AI** (or Windows 11, second entry)
3. Select with arrow keys on keyboard → press **Enter**.
4. If selected Windows Personal — enter BitLocker password.
5. If selected Windows AI — boots without password.

---

## Part 7. Securing Windows AI

### Step 16. UAC at maximum

1. In Windows AI press **Win + S** → start typing `uac`.
2. Click **Change User Account Control settings**.
3. Move slider all the way up — **Always notify**.
4. Click **OK**.
5. Restart computer.

### Step 17. Disable Windows Defender shutdown

1. Press **Win + R**.
2. In window type: `gpedit.msc` → click **OK**.
3. If Windows says file not found (gpedit.msc missing in Home edition), use alternative:
  - Open **Registry Editor**: `Win + R` → `regedit` → **OK**.
  - Navigate: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender`
  - If **Windows Defender** folder doesn't exist — create: right-click **Microsoft** → **New** → **Key** → name `Windows Defender`.
  - Inside right-click → **New** → **DWORD (32-bit) Value** → name `DisableAntiSpyware`.
  - Double-click → value `0` → **OK**.
4. Restart computer.

### Step 18. Disk image (backup)

1. In Windows AI open browser.
2. Type: `macrium.com/reflectfree` → download Macrium Reflect Free.
3. Install: double-click file → **Next** → **Next** → **Install**.
4. Launch program.
5. Click **Create a backup** → **Image this disk**.
6. Select Windows AI disk.
7. Click link below disk **Select a location for your image**.
8. Select external drive (USB flash/external HDD) or another partition.
9. Click **Next** → **Finish**.
10. Wait. Image will be 20-40 GB.
11. If Windows AI breaks — boot from Macrium Rescue CD (created in program) and restore image in 20 minutes.

---

## Part 8. Installing AI Agent

### Step 19. Install required programs

1. **Git**: `git-scm.com` → download → install (all defaults).
2. **Node.js**: `nodejs.org` → download LTS version → install.
3. **Python**: `python.org` → Downloads → Windows → Python 3.11+ → install (check **Add Python to PATH**).

### Step 20. Install Hermes

1. Open **Terminal** or **PowerShell** (right-click Start → **Terminal (admin)**).
2. Type:
  
  ```
  curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
  ```
  
3. Wait for installation to complete.
4. Type: `hermes setup` → follow instructions.
5. Type: `hermes model` → select model (Claude, GPT-4o, local).
6. Enter API key (if using cloud model).

### Step 21. Configure memory and skills

1. Open File Explorer → user folder → `.hermes`.
2. Create file **SOUL.md** — write who the agent is (e.g., "You are experienced programmer, help write Python code").
3. Create file **USER.md** — write about yourself ("I am beginner developer, prefer simple solutions").
4. Create folder **skills** → inside file **deploy.md** — describe your project deploy process.
5. To add skills from repository: `hermes skills tap add nousresearch/skills`.

### Step 22. Install OpenClaw (alternative)

1. In Terminal type:
  
  ```
  npm install -g openclaw@latest
  ```
  
2. Then: `openclaw onboard --install-daemon`
3. Configure `openclaw.json` in user folder.
4. For memory: `openclaw plugins install @mem0/openclaw-mem0`.

---

## Part 9. Work Rules

| What to do | How to do |
| --- | --- |
| Work with AI agent | Boot Windows AI |
| Banking, personal, games | Boot Windows Personal |
| Do NOT enter BitLocker password in Windows AI | This opens access to your data |
| Do NOT save passwords in Windows AI browser | No personal accounts there |
| Update Windows AI | Every 2 months manually or auto security updates |
| Make disk image | Once after setup. Then after major changes. |

---

## Part 10. If Something Goes Wrong

### Boot menu doesn't appear

- Boot into Windows Personal → `Win + R` → `msconfig` → **Boot** tab → check both systems are in list.

### Hermes won't install

- Check Python, Node.js, Git are installed. In terminal type: `python --version`, `node --version`, `git --version`.

### BitLocker asks for recovery key

- Log into Microsoft account on another device → **Devices** section → find your computer → **Manage BitLocker keys**.

### Windows AI is broken

- Boot from Macrium Reflect Rescue flash drive → select image → restore.

---

**Done. Your AI agent is isolated. Personal data is secure.**
