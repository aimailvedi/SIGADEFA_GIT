[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host "--- ЗАПУСК ГЛОБАЛЬНОЙ СИНХРОНИЗАЦИИ (v3) ---" -ForegroundColor Cyan

# 1. Фиксация локальных изменений
git add .
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Sync: Total Capture ($timestamp)"

# 2. Синхронизация (сначала забираем, потом отдаем)
Write-Host "Обмен данными с Королевским Каналом..." -ForegroundColor Gray
git branch -M main
git pull origin main --rebase
git push origin main -f

# 3. Запись в Audit-log
"[$timestamp] SYNC_COMPLETE: Успешная привязка и синхронизация." | Out-File -FilePath "04_KNOWLEDGE\HUMUS\audit.log" -Append -Encoding utf8

Write-Host "--- СИНХРОНИЗАЦИЯ ЗАВЕРШЕНА УСПЕШНО ---" -ForegroundColor Green
Pause
