$thought = Read-Host "Архитектор, назови интенцию (SEED)"
if (-not $thought) { Write-Host "Пустота не может быть семенем." -ForegroundColor Red; exit }

# Генерируем метаданные
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$dateHuman = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$hash = [BitConverter]::ToString(( [System.Security.Cryptography.SHA256]::Create().ComputeHash([System.Text.Encoding]::UTF8.GetBytes($thought + $timestamp)) )).Replace("-", "").Substring(0, 8)

# Формируем имя файла и содержимое
$fileName = "SEED_$timestamp`_$hash.md"
$filePath = "D:\GENESIS_TREE\05_SEEDS\$fileName"

$content = @"
---
ID: $hash
CREATED: $dateHuman
STATUS: RAW_POTENTIAL
ORIGIN: VOICE_INPUT
---
# SEED: Мысль зафиксирована

> $thought

---
*Ожидает прорастания...*
"@

$content | Out-File -FilePath $filePath -Encoding utf8
Write-Host "Семя зафиксировано: $fileName" -ForegroundColor Cyan
