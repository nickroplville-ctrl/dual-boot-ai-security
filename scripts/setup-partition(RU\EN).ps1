# ============================================================================
# PowerShell Script: Create partition for Windows AI
# WARNING: Backup your data first! This will modify your disk!
# Run as Administrator
# ============================================================================

Write-Host "=== Partition Setup for Windows AI ===" -ForegroundColor Green
Write-Host "WARNING: This will modify your disk!" -ForegroundColor Red
Write-Host ""

# Check admin rights
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Error: Run as Administrator!" -ForegroundColor Red
    exit
}

# Check disk style
$disk = Get-Disk -Number (Get-Partition -DriveLetter C).DiskNumber
Write-Host "Disk style: $($disk.PartitionStyle)" -ForegroundColor Yellow
if ($disk.PartitionStyle -ne "GPT") {
    Write-Host "WARNING: Disk is not GPT. Windows 11 requires GPT for UEFI." -ForegroundColor Red
    Write-Host "Convert to GPT first or use legacy BIOS mode." -ForegroundColor Yellow
    $continue = Read-Host "Continue anyway? (yes/no)"
    if ($continue -ne "yes") { exit }
}

# Show current state
Write-Host ""
Write-Host "Current disk layout:" -ForegroundColor Yellow
Get-Partition | Where-Object {$_.Type -eq "Basic"} | Format-Table DriveLetter, @{Label="Size(GB)"; Expression={[math]::Round($_.Size/1GB,1)}}, Type

$C = Get-Partition -DriveLetter C
$freeSpace = [math]::Floor((Get-Volume -DriveLetter C).SizeRemaining / 1GB)
Write-Host ""
Write-Host "C: drive free space: ~ $freeSpace GB" -ForegroundColor Cyan

# Warning about unmovable files
Write-Host ""
Write-Host "WARNING: If shrink fails, disable hibernation and pagefile:" -ForegroundColor Yellow
Write-Host "  powercfg /hibernate off" -ForegroundColor White
Write-Host "  System Properties -> Advanced -> Performance -> Advanced -> Virtual Memory -> No paging file" -ForegroundColor White
Write-Host ""

# Validate input
do {
    $sizeGB = Read-Host "Enter size for Windows AI in GB (e.g. 400)"
    $valid = [int]::TryParse($sizeGB, [ref]$null)
    if (-not $valid -or [int]$sizeGB -le 0 -or [int]$sizeGB -ge $freeSpace) {
        Write-Host "Invalid input. Must be number between 1 and $freeSpace" -ForegroundColor Red
        $valid = $false
    }
} while (-not $valid)

$sizeMB = [int]$sizeGB * 1024
$sizeBytes = [int64]$sizeMB * 1MB

Write-Host ""
Write-Host "Will create partition: $sizeGB GB" -ForegroundColor Green
Write-Host "Available after shrink: ~ $([math]::Floor(($C.Size - $sizeBytes)/1GB)) GB on C:" -ForegroundColor Cyan

# Confirmation
$confirm = Read-Host "Proceed? (yes/no)"
if ($confirm -ne "yes") {
    Write-Host "Cancelled" -ForegroundColor Yellow
    exit
}

# Shrink C:
try {
    Write-Host ""
    Write-Host "Shrinking C: drive..." -ForegroundColor Yellow
    Resize-Partition -DriveLetter C -Size ($C.Size - $sizeBytes) -ErrorAction Stop
    Write-Host "C: drive shrunk successfully" -ForegroundColor Green
} catch {
    Write-Host "Error shrinking C: $_" -ForegroundColor Red
    Write-Host "Try disabling hibernation and pagefile, then retry." -ForegroundColor Yellow
    exit
}

# Create partition
try {
    Write-Host ""
    Write-Host "Creating partition..." -ForegroundColor Yellow
    $newPartition = New-Partition -DiskNumber $disk.Number -Size $sizeBytes
    Write-Host "Partition created: $($newPartition.DriveLetter)" -ForegroundColor Green
} catch {
    Write-Host "Error creating partition: $_" -ForegroundColor Red
    exit
}

# Format
$formatConfirm = Read-Host "Format new partition as NTFS? (yes/no)"
if ($formatConfirm -eq "yes") {
    try {
        Format-Volume -Partition $newPartition -FileSystem NTFS -NewFileSystemLabel "Windows-AI" -Confirm:$false
        Write-Host "Formatted successfully" -ForegroundColor Green
    } catch {
        Write-Host "Format error: $_" -ForegroundColor Red
    }
}

# Results
Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Green
Write-Host "Script finished at $(Get-Date)" -ForegroundColor Cyan
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Enable BitLocker on C:" -ForegroundColor White
Write-Host "2. Install Windows AI on new partition" -ForegroundColor White
Write-Host "3. Configure boot menu" -ForegroundColor White


# ============================================================================
# PowerShell Скрипт: Создание раздела для Windows ИИ
# ВНИМАНИЕ: Сначала сделайте резервную копию! Это изменит ваш диск!
# Запускать от имени Администратора
# ============================================================================

Write-Host "=== Создание раздела для Windows ИИ ===" -ForegroundColor Green
Write-Host "ВНИМАНИЕ: Это изменит ваш диск!" -ForegroundColor Red
Write-Host ""

# Проверка прав администратора
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Ошибка: Запустите от имени Администратора!" -ForegroundColor Red
    exit
}

# Проверка стиля диска
$disk = Get-Disk -Number (Get-Partition -DriveLetter C).DiskNumber
Write-Host "Стиль диска: $($disk.PartitionStyle)" -ForegroundColor Yellow
if ($disk.PartitionStyle -ne "GPT") {
    Write-Host "ВНИМАНИЕ: Диск не GPT. Windows 11 требует GPT для UEFI." -ForegroundColor Red
    Write-Host "Сначала конвертируйте в GPT или используйте legacy BIOS." -ForegroundColor Yellow
    $continue = Read-Host "Продолжить в любом случае? (yes/no)"
    if ($continue -ne "yes") { exit }
}

# Показать текущее состояние
Write-Host ""
Write-Host "Текущая разметка:" -ForegroundColor Yellow
Get-Partition | Where-Object {$_.Type -eq "Basic"} | Format-Table DriveLetter, @{Label="Размер(ГБ)"; Expression={[math]::Round($_.Size/1GB,1)}}, Type

$C = Get-Partition -DriveLetter C
$freeSpace = [math]::Floor((Get-Volume -DriveLetter C).SizeRemaining / 1GB)
Write-Host ""
Write-Host "Свободно на C: ~ $freeSpace ГБ" -ForegroundColor Cyan

# Предупреждение о неудаляемых файлах
Write-Host ""
Write-Host "ВНИМАНИЕ: Если сжатие не работает, отключите гибернацию и файл подкачки:" -ForegroundColor Yellow
Write-Host "  powercfg /hibernate off" -ForegroundColor White
Write-Host "  Свойства системы -> Дополнительно -> Быстродействие -> Дополнительно -> Виртуальная память -> Без файла подкачки" -ForegroundColor White
Write-Host ""

# Валидация ввода
do {
    $sizeGB = Read-Host "Введите размер Windows ИИ в ГБ (например, 400)"
    $valid = [int]::TryParse($sizeGB, [ref]$null)
    if (-not $valid -or [int]$sizeGB -le 0 -or [int]$sizeGB -ge $freeSpace) {
        Write-Host "Неверный ввод. Число от 1 до $freeSpace" -ForegroundColor Red
        $valid = $false
    }
} while (-not $valid)

$sizeMB = [int]$sizeGB * 1024
$sizeBytes = [int64]$sizeMB * 1MB

Write-Host ""
Write-Host "Будет создан раздел: $sizeGB ГБ" -ForegroundColor Green
Write-Host "Останется на C: ~ $([math]::Floor(($C.Size - $sizeBytes)/1GB)) ГБ" -ForegroundColor Cyan

# Подтверждение
$confirm = Read-Host "Продолжить? (yes/no)"
if ($confirm -ne "yes") {
    Write-Host "Отменено" -ForegroundColor Yellow
    exit
}

# Сжатие диска C:
try {
    Write-Host ""
    Write-Host "Сжатие диска C:..." -ForegroundColor Yellow
    Resize-Partition -DriveLetter C -Size ($C.Size - $sizeBytes) -ErrorAction Stop
    Write-Host "Диск C: успешно сжат" -ForegroundColor Green
} catch {
    Write-Host "Ошибка сжатия C: $_" -ForegroundColor Red
    Write-Host "Попробуйте отключить гибернацию и файл подкачки, затем повторите." -ForegroundColor Yellow
    exit
}

# Создание раздела
try {
    Write-Host ""
    Write-Host "Создание раздела..." -ForegroundColor Yellow
    $newPartition = New-Partition -DiskNumber $disk.Number -Size $sizeBytes
    Write-Host "Раздел создан: $($newPartition.DriveLetter)" -ForegroundColor Green
} catch {
    Write-Host "Ошибка создания раздела: $_" -ForegroundColor Red
    exit
}

# Форматирование
$formatConfirm = Read-Host "Форматировать раздел в NTFS? (yes/no)"
if ($formatConfirm -eq "yes") {
    try {
        Format-Volume -Partition $newPartition -FileSystem NTFS -NewFileSystemLabel "Windows-AI" -Confirm:$false
        Write-Host "Форматирование завершено" -ForegroundColor Green
    } catch {
        Write-Host "Ошибка форматирования: $_" -ForegroundColor Red
    }
}

# Результаты
Write-Host ""
Write-Host "=== Готово ===" -ForegroundColor Green
Write-Host "Скрипт завершён: $(Get-Date)" -ForegroundColor Cyan
Write-Host "Следующие шаги:" -ForegroundColor Yellow
Write-Host "1. Включить BitLocker на C:" -ForegroundColor White
Write-Host "2. Установить Windows ИИ на новый раздел" -ForegroundColor White
Write-Host "3. Настроить меню загрузки" -ForegroundColor White
