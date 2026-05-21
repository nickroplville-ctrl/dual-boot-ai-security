# ============================================================================
# PowerShell Script: Create partition for Windows AI / Создание раздела для Windows ИИ
# Run as Administrator in Windows Personal / Запускать от имени Администратора в Windows Твой
# ============================================================================

Write-Host "=== Partition Setup for Windows AI / Создание раздела для Windows ИИ ===" -ForegroundColor Green
Write-Host ""

# Check if running as admin / Проверка прав администратора
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Error: Run this script as Administrator! / Ошибка: Запустите скрипт от имени Администратора!" -ForegroundColor Red
    exit
}

# Get disk info / Информация о диске
Write-Host "Current disk layout / Текущая разметка диска:" -ForegroundColor Yellow
Get-Partition | Where-Object {$_.Type -eq "Basic"} | Format-Table DriveLetter, Size, Type

# Ask for size / Запрос размера
$sizeGB = Read-Host "Enter size for Windows AI partition in GB (e.g., 400) / Введите размер раздела Windows ИИ в ГБ (например, 400)"
$sizeMB = [int]$sizeGB * 1024

Write-Host ""
Write-Host "Creating partition of $sizeGB GB... / Создание раздела $sizeGB ГБ..." -ForegroundColor Yellow

# Shrink C: drive / Сжатие диска C:
$C = Get-Partition -DriveLetter C
$sizeBytes = [int64]$sizeMB * 1MB

try {
    Resize-Partition -DriveLetter C -Size ($C.Size - $sizeBytes)
    Write-Host "C: drive shrunk successfully / Диск C: успешно сжат" -ForegroundColor Green
    
    # Create new partition / Создание нового раздела
    $disk = Get-Disk -Number $C.DiskNumber
    $newPartition = New-Partition -DiskNumber $C.DiskNumber -UseMaximumSize
    Format-Volume -Partition $newPartition -FileSystem NTFS -NewFileSystemLabel "Windows-AI" -Confirm:$false
    
    Write-Host ""
    Write-Host "Partition created successfully! / Раздел успешно создан!" -ForegroundColor Green
    Write-Host "Drive letter / Буква диска: $($newPartition.DriveLetter)" -ForegroundColor Cyan
    Write-Host "Size / Размер: $sizeGB GB" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next steps / Следующие шаги:" -ForegroundColor Yellow
    Write-Host "1. Enable BitLocker on C: drive / Включить BitLocker на диске C:" -ForegroundColor White
    Write-Host "2. Install Windows AI on new partition / Установить Windows ИИ на новый раздел" -ForegroundColor White
    Write-Host "3. Configure boot menu / Настроить меню загрузки" -ForegroundColor White
} catch {
    Write-Host "Error / Ошибка: $_" -ForegroundColor Red
    Write-Host "Make sure you have enough free space on C: drive / Убедитесь, что на диске C: достаточно свободного места" -ForegroundColor Yellow
}
