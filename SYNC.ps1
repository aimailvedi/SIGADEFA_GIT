[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host "--- ЗАПУСК ГЛОБАЛЬНОЙ СИНХРОНИЗАЦИИ ---" -ForegroundColor Cyan

# Проверяем связь с миром
git pull origin main --rebase

# Фиксируем всё локальное
git add .
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Sync: Автоматическое сохранение состояния ($timestamp)"

# Бросок в Королевский Канал
git push origin main

Write-Host "--- СИНХРОНИЗАЦИЯ ЗАВЕРШЕНА УСПЕШНО ---" -ForegroundColor Green
Pause
