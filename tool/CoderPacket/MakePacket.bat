@echo off
title L1JTW Â²©ö¥´¥]¤u¨ã
cls

REM --------------------------------------------------------------------------------------------
REM ½Ð³]©w¥H¤Uªº¸ê®Æ®w³]©w­È,¨Ã¨Ï¥Î¥´¥]¤u¨ã±N¸ê®Æ®w¥ý¦æ¥´¥]§¹¦¨.
REM --------------------------------------------------------------------------------------------
REM Language=tw¡G¿ï¾Ü¹ïÀ³»y¨ten/cn/tw 
REM Selected=1:(¥þ¥´¥]) 2:(¶È§t src & DB & tool & data)
REM 7zDir= 7z.exe µ´¹ï¸ô®|
REM --------------------------------------------------------------------------------------------
set Language=tw
set Selected=2
set Dir7z="E:\Program Files\7-Zip\7z.exe"
goto Base

Rem --------------------------------------------------------------------------------------------
Rem -   °ò¥»°õ¦æ
Rem --------------------------------------------------------------------------------------------
:Base
copy .\workplace\xer.bat .\workplace\var.bat
..\subversion\svnversion.exe>>.\workplace\var.bat
call .\workplace\var.bat
del .\workplace\var.bat
cls

goto %Language%


Rem --------------------------------------------------------------------------------------------
Rem -  ¥D¨t²Î¿ï³æ
Rem --------------------------------------------------------------------------------------------
:Start
echo %Language_Line11%
echo %Language_Line12%
echo.
echo %Language_choose1%
echo %Language_choose2%
echo %Language_choose9%
echo.
set /p Selected="%Language_Action%"
goto Select%Selected%


Rem --------------------------------------------------------------------------------------------
Rem -   »y¨¥¼Ò²Õ
Rem --------------------------------------------------------------------------------------------
:tw
set Language_Line11= ª©¥»½s¸¹: %Var%
set Language_Line12= ¸ÑÀ£ÁY³nÅé7z ¥Ø¿ý: %Dir7z%
set Language_choose1= ¡n1. §¹¾ã¥]       [L1J-TW_ver.%Var%_FP.7z]
set Language_choose2= ¡n2. Src+DB¼Ð·Ç¥] [L1J-TW_ver.%Var%_NP.7z]
set Language_choose9= ¡n9. Â÷¶}
set Language_Action=¿ï¾Ü¡G
goto Start

:cn
set Language_Line11= ª©¥»ˆC†A: %Var%
set Language_Line12= ¸Ñ‰ÍŠD„°Ê^7z ¥Ø‰£: %Dir7z%
set Language_choose1= ¡n1. §¹¾ã¥]       [L1J-TW_ver.%Var%_FP.7z]
set Language_choose2= ¡n2. ‡á­ã¥]       [L1J-TW_ver.%Var%_NP.7z]
set Language_choose9= ¡n9. ÖÃ…{
set Language_Action=‰uˆá¡G
goto Start

:en
set Language_Line11= Version is: %Var%
set Language_Line12= 7z install: %Dir7z%
set Language_choose1= ¡n1. FullPack     [L1J-TW_ver.%Var%_FP.7z]
set Language_choose2= ¡n2. normalPack   [L1J-TW_ver.%Var%_NP.7z]
set Language_choose9= ¡n9. Exit
set Language_Action=Actions¡G
goto Start

Rem --------------------------------------------------------------------------------------------
REM -   °Ê§@©w¸q
Rem --------------------------------------------------------------------------------------------
:Select1
title Building File about L1J-TW_ver.%Var%_FP.7z
@%Dir7z% a -tzip ..\..\..\L1J-TW_ver.%Var%_FP.7z ..\..\* -r -x@Fullpack\Exclusion.lst -mx=9
goto exit

:Select2
title Building File about  L1J-TW_ver.%Var%_NP.7z
@%Dir7z% a -tzip ..\..\..\L1J-TW_ver.%Var%_NP.7z -r @normalpack\Pack.lst -x@normalpack\Exclusion.lst -mx=9
goto exit

:Select9
cls
exit
