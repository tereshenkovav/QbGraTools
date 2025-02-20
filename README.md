# QbGraTools

Low-level graphic library for QuickBasic 4.5\
Низкоуровневая графическая библиотека для QuickBasic 4.5

### О проекте

Библиотека содержит функции для быстрого вывода графики в буфер, загрузки
PCX-спрайтов, рисование примитивов, вывода шрифта и обработки анимации,
а также некоторые дополнительные функции, отсутствующие в QuickBasic.
Часть функций написана на ассемблер NASM, часть на самом QuickBasic.
В настоящий момент поддерживается только графический режим 13,
с разрешением экрана 320x200 и 256 индексированных цветов.

### Состав библиотеки

В каталоге `source` находятся исходные файлы библиотеки:

* GRABUILD.BAT - скрипт сборки
* GRATOOLS.ASM - включаемые ассемблерные процедуры
* GRATOOLS.BAS - включаемые процедуры на Бейсике
* GRATOOLS.BI - заголовочный файл для библиотеки
* popregs.asm, pushregs.asm - включаемые файлы сохранения и восстановления регистров

В каталоге `examples` находятся некоторые примеры использования библиотеки.

В каталоге `fonts` находится пример шрифта для работы текстовых функций.

В каталоге `utils` находится программа создания шрифта.

### Сборка

Для сборки можно использовать виртуальную машину с DOS/FreeDOS или же DOSBox, подключив в нём каталог, в котором доступны QuickBasic, NASM и файлы библиотеки.
Копируем все файлы из `source`
в каталог, где установлен QuickBasic, указываем в скрипте `grabuild.bat`
правильный путь к NASM (исходно он задан как `C:\NASM`), потом запускаем скрипт
`grabuild.bat`.
При правильной сборке, в каталоге появятся файлы `gratools.qlb` и `gratools.lib`.
Это скомпилированная графическая библиотека для работы с IDE QuickBasic и для получения EXE-файла проекта.

### Использование

Для использования библиотеки в QuickBasic IDE, сначала надо скопировать
файлы `gratools.qlb`, `gratools.lib` и `gratools.bi` в каталог установленного QuickBasic, после чего запустить
IDE командой, которая подгрузит графическую библиотеку.

```
qb.exe /l gratools.qlb
```

В файле проекта на Бейсике нужно подключить заголовочный файл библиотеки, установить
массивы как динамические (иначе возможны проблемы с получением EXE-файлов)
и включить режим экрана 13. 

```
'$INCLUDE: 'gratools.bi'
'$DYNAMIC
SCREEN 13
```

Для сборки исполнимого файла проекта с библиотекой (например, `game.bas`),
нужно использовать команды компилятора и линковщика QuickBasic
```
bc game.bas game.obj,NUL
link /noe game.obj+noem.obj,game.exe,NUL,gratools.lib+bcom45.lib
```

### Расширенные примеры использования

Максимально полное использование библиотеки можно посмотреть в проекте игры
"Трикси и алмазы", написанной на основе данной библиотеки.

https://github.com/tereshenkovav/Trixie16bit
