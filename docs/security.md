# Security Details

## Windows AI Protection

### 1. UAC at Maximum
- Control Panel → User Accounts → Change UAC settings → Always notify
- Blocks silent system changes

### 2. Disable Windows Defender Shutdown
- `Win + R` → `gpedit.msc`
- Computer Configuration → Administrative Templates → Windows Components → Microsoft Defender Antivirus → Turn off Microsoft Defender → Disabled
- Or via Registry: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware = 0`

### 3. Disk Image Backup
- Install Macrium Reflect Free
- Create image of entire Windows AI disk
- Save to external drive
- Restore in 20 minutes if malware hits

### 4. BIOS Protection
- Set BIOS password (prevents boot order changes)
- Enable Secure Boot (blocks unsigned systems)
- Disable USB boot (prevents booting from flash drives)

### 5. Network Isolation
- Windows AI and Windows Personal never run simultaneously
- BitLocker encrypts Windows Personal when offline
- No network bridge between systems

### 6. Update Policy
- Auto security updates: ON
- Feature updates: manual, every 2 months
- Image backup after major changes
