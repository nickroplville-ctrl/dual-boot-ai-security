# Troubleshooting

## Common Errors and Solutions

### 1. Boot Menu Doesn't Appear

**Problem:** Computer boots directly to Windows Personal without selection menu.

**Solution:**
1. Boot into Windows Personal.
2. Press `Win + R` → type `msconfig` → **Enter**.
3. Go to **Boot** tab.
4. Check both systems are listed. If Windows AI is missing — click **Add** and point to Windows AI drive.
5. Click **Apply** → **OK** → restart.

---

### 2. BitLocker Asks for Recovery Key

**Problem:** Windows Personal asks for 48-digit recovery key instead of password.

**Solution:**
1. On another device (phone/tablet) log into your **Microsoft account**.
2. Go to **Devices** → find your computer.
3. Click **Manage BitLocker keys** — recovery key is there.
4. Enter it on the computer. After boot, turn off and re-enable BitLocker with password.

---

### 3. Hermes Won't Install on Windows AI

**Problem:** Error when running `curl` or `hermes setup`.

**Solution:**
1. Check installed programs. In terminal type:
   - `python --version` (should be 3.11+)
   - `node --version` (should be 18+)
   - `git --version`
2. If any command fails — reinstall that program.
3. Ensure Windows AI has internet connection.
4. If using WSL for Hermes — ensure WSL is installed: `wsl --install` in admin PowerShell.

---

### 4. Not Enough Free Space to Shrink C: Drive

**Problem:** "Shrink Volume" option is grayed out or shows little space.

**Solution:**
1. Clean up C: drive:
   - File Explorer → C: drive → right-click → **Properties** → **Disk Cleanup**.
   - Check everything unnecessary (Recycle Bin, Temp files, Downloads) → **OK**.
2. Uninstall unused programs: **Settings** → **Apps** → uninstall what you don't use.
3. Move large files (photos, videos) to external drive.
4. Restart computer and try again.

---

### 5. Windows AI Can't See Wi-Fi

**Problem:** No internet after installing Windows AI.

**Solution:**
1. Press `Win + X` → **Device Manager**.
2. Find **Network adapters**.
3. If yellow triangle — driver not installed.
4. Connect via Ethernet cable or download Wi-Fi driver on another device and transfer via USB.
5. Install driver — usually from laptop/motherboard manufacturer website.

---

### 6. Rufus Doesn't See USB Drive

**Problem:** "Device" field in Rufus is empty.

**Solution:**
1. Ensure USB is inserted (prefer USB 2.0 port if available).
2. Try different port.
3. Restart Rufus.
4. If nothing helps — format USB to FAT32 via File Explorer, then restart Rufus.

---

### 7. Forgot BitLocker Password

**Problem:** Don't remember Windows Personal password, lost recovery key too.

**Solution:**
- Unfortunately, data is permanently lost. BitLocker cannot be cracked.
- In future: save recovery key in reliable place (Microsoft account, printout, safe).

---

### 8. Windows AI is Slow

**Problem:** Everything is slow in Windows AI, programs take long to open.

**Solution:**
1. Press `Ctrl + Shift + Esc` → **Task Manager**.
2. Check what's loading CPU/memory/disk.
3. Close unnecessary programs.
4. Ensure Windows AI is installed on SSD, not old HDD.
5. If on HDD — consider moving to SSD.

---

### 9. Can't Remove Windows AI

**Problem:** Want to remove dual boot, keep only Windows Personal.

**Solution:**
1. Boot into Windows Personal.
2. `Win + X` → **Disk Management**.
3. Find Windows AI partition → right-click → **Delete Volume** → **Yes**.
4. "Unallocated" space appears → right-click on C: drive → **Extend Volume** → **Next** → **Next** → **Finish**.
5. `Win + R` → `msconfig` → **Boot** tab → select Windows AI → **Delete** → **OK**.
6. Restart.

---

### 10. Hermes Accidentally Disabled Windows Defender

**Problem:** Windows Defender is off despite gpedit configuration.

**Solution:**
1. Check gpedit is configured correctly (see security.md).
2. If Defender is still disabled — restore Windows AI disk image from backup.
3. After restore, check gpedit again.
