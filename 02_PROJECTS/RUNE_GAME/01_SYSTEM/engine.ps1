Function Start-GenesisLoop {
    Write-Host "--- СЕРДЦЕ СИСТЕМЫ ЗАПУЩЕНО (RUN) ---" -ForegroundColor Yellow
    
    # Считаем количество SEEDS для определения темпа (Усиление Пульса)
    $seedsCount = (Get-ChildItem -Path "D:\GENESIS_TREE\05_SEEDS" -File -Recurse).Count
    if ($seedsCount -lt 1) { $seedsCount = 1 }
    $speed = 1 / $seedsCount # Чем больше семян, тем быстрее такт
    
    Write-Host "Мощность Пульса: $seedsCount (Интервал: $speed сек)" -ForegroundColor Cyan

    for ($i=1; $i -le 5; $i++) {
        $timestamp = Get-Date -Format "HH:mm:ss"
        # Используем ${}, чтобы избежать конфликта с дисками (исправляем ошибку)
        Write-Host "[${timestamp}] Такт ${i}: Проверка фрактальных слоев..." -ForegroundColor Gray
        
        $seed = "RUNE_BASE_STRIKE"
        Write-Host "  -> Активация SEED: ${seed}" -ForegroundColor DarkCyan
        
        Start-Sleep -Seconds $speed
    }
    Write-Host "--- ЦИКЛ ЗАВЕРШЕН ---" -ForegroundColor Green
}
