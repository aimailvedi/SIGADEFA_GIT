document.addEventListener('DOMContentLoaded', () => {
    console.log("SIGADEFA: Система режимов активирована.");
    
    const modes = ['science', 'philosophy', 'kids'];
    const body = document.body;

    window.changeMode = (selectedMode) => {
        // Удаляем все старые режимы
        modes.forEach(mode => body.classList.remove('mode-' + mode));
        // Добавляем новый
        body.classList.add('mode-' + selectedMode);
        console.log("Переключение на режим: " + selectedMode);
        localStorage.setItem('genesis_mode', selectedMode);
    };

    // Восстановление режима после перезагрузки
    const savedMode = localStorage.getItem('genesis_mode');
    if (savedMode) changeMode(savedMode);
});
