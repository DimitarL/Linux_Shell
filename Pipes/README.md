# Задачи върху Пайпове
* 03-a-0200  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сортирайте /etc/passwd лексикографски по поле UserID.
* 03-a-0201  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Сортирайте /etc/passwd числово по поле UserID.
(Открийте разликите с лексикографската сортировка)
* 03-a-0210  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Изведете само 1-ва и 5-та колона на файла /etc/passwd спрямо разделител ":".
* 03-a-0211  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Изведете съдържанието на файла /etc/passwd от 2-ри до 6-ти символ.
* 03-a-1500  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Отпечатайте потребителските имена и техните home директории от /etc/passwd.
* 03-a-2000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;С отделни команди, извадете от файл /etc/passwd:
- първите 12 реда
- първите 26 символа
- всички редове, освен последните 4
- последните 17 реда
- 151-я ред (или друг произволен, ако нямате достатъчно редове)
- последните 4 символа от 13-ти ред (символът за нов ред не е част от реда)
* 03-a-2100  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-a-2110  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-a-3000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Запаметете във файл в своята home директория резултатът от командата `df -P`.
Напишете команда, която извежда на екрана съдържанието на този файл, без първия ред (хедъра), сортирано по второ поле (numeric).
* 03-a-5000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-a-5001  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-a-5002  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-a-5003  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-a-5004  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-0300  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-3000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-3400  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-3500  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-3600  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-4000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Създайте следната файлова йерархия в home директорията ви:
dir5/file1
dir5/file2
dir5/file3

Посредством vi въведете следното съдържание:
file1:
1
2
3

file2:
s
a
d
f

file3:
3
2
1
45
42
14
1
52

Изведете на екрана:
	* статистика за броя редове, думи и символи за всеки един файл
	* статистика за броя редове и символи за всички файлове
	* общия брой редове на трите файла
* 03-b-4001  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Във file2 (inplace) подменете всички малки букви с главни.
* 03-b-4002  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Във file3 (inplace) изтрийте всички "1"-ци.
* 03-b-4003  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Изведете статистика за най-често срещаните символи в трите файла.
* 03-b-4004  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Направете нов файл с име по ваш избор, чието съдържание е конкатенирани съдържанията на file{1,2,3}.
* 03-b-4005  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Прочетете текстов файл file1 и направете всички главни букви малки като запишете резултата във file2.
* 03-b-5200  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Намерете броя на символите, различни от буквата 'а' във файла /etc/passwd
* 03-b-5300  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Намерете броя на уникалните символи, използвани в имената на потребителите от /etc/passwd.
* 03-b-5400  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Отпечатайте всички редове на файла /etc/passwd, които не съдържат символния низ 'ов'.
* 03-b-6100  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Отпечатайте последната цифра на UID на всички редове между 28-ми и 46-ред в /etc/passwd.
* 03-b-6700  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Отпечатайте правата (permissions) и имената на всички файлове, до които имате read достъп, намиращи се в директорията /tmp. (hint: 'man find', вижте -readable)
* 03-b-6900  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Намерете имената на 10-те файла във вашата home директория, чието съдържание е редактирано най-скоро. На първо място трябва да бъде най-скоро редактираният файл. Намерете 10-те най-скоро достъпени файлове. (hint: Unix time)
* 03-b-7000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Да приемем, че файловете, които съдържат C код, завършват на `.c` или `.h`.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Колко на брой са те в директорията `/usr/include`?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Колко реда C код има в тези файлове?
* 03-b-7500  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Даден ви е ASCII текстов файл - /etc/services. Отпечатайте хистограма на 10-те най-често срещани думи.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Дума наричаме непразна последователност от букви. Не правим разлика между главни и малки букви.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Хистограма наричаме поредица от редове, всеки от които има вида:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<брой срещания> <какво се среща толкова пъти>
* 03-b-8000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Вземете факултетните номера на студентите (описани във файла /srv/os/mypasswd.txt) от СИ и ги запишете във файл si.txt сортирани. Студент е част от СИ, ако home директорията на този потребител (според /srv/os/mypasswd.txt) се намира в /home/SI директорията.
* 03-b-8500  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;За всяка група от /etc/group изпишете "Hello, <група>", като ако това е вашата група, напишете "Hello, <група> - I am here!".
* 03-b-8520  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
* 03-b-8600  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Shell Script-овете са файлове, които по конвенция имат разширение .sh. Всеки
такъв файл започва с "#!<interpreter>" , където <interpreter> указва на
операционната система какъв интерпретатор да пусне (пр: "#!/bin/bash",
"#!/usr/bin/python3 -u").

Намерете всички .sh файлове в директорията `/usr` и нейните поддиректории, и
проверете кой е най-често използваният интерпретатор.
* 03-b-8700  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Изведете GID-овете на 5-те най-големи групи спрямо броя потребители, за които
съответната група е основна (primary).
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. (*) Изведете имената на съответните групи.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hint: /etc/passwd
* 03-b-9000  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Направете файл eternity. Намерете всички файлове, намиращи се във вашата home директория и нейните поддиректории, които са били модифицирани в последните 15мин (по възможност изключете .).  Запишете във eternity името (път) на файла и времето (unix time) на последната промяна.
* 03-b-9050  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Копирайте файл /srv/os/population.csv във вашата home директория.
* 03-b-9051  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Използвайки файл population.csv, намерете колко е общото население на света през 2008 година. А през 2016?
* 03-b-9052  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Използвайки файл population.csv, намерете през коя година в България има най-много население.
* 03-b-9053  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Използвайки файл population.csv, намерете коя държава има най-много население през 2016. А коя е с най-малко население?
(Hint: Погледнете имената на държавите)
* 03-b-9054  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Използвайки файл population.csv, намерете коя държава е на 42-ро място по население през 1969. Колко е населението й през тази година?
* 03-b-9101  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Да се разархивира архивът songs.tar.gz в папка songs във вашата home директорията.
* 03-b-9102  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Да се изведат само имената на песните.
* 03-b-9103  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Имената на песните да се направят с малки букви, да се заменят спейсовете с долни черти и да се сортират.
* 03-b-9104  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Да се изведат всички албуми, сортирани по година.
* 03-b-9105  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Да се преброят/изведат само песните на Beatles и Pink.
* 03-b-9106  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Да се направят директории с имената на уникалните групи. За улеснение, имената от две думи да се напишат слято:
Beatles, PinkFloyd, Madness
* 03-b-9200  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Напишете серия от команди, които извеждат детайли за файловете и директориите в текущата директория, които имат същите права за достъп както най-големият файл в /etc директорията.
* 03-b-9300  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Дадени са ви 2 списъка с email адреси - първият има 12 валидни адреса, а вторията има само невалидни. Филтрирайте всички адреси, така че да останат само валидните. Колко кратък регулярен израз можете да направите за целта?
   * Валидни email адреси (12 на брой):  
email@example.com
firstname.lastname@example.com
email@subdomain.example.com
email@123.123.123.123
1234567890@example.com
email@example-one.com
_______@example.com
email@example.name
email@example.museum
email@example.co.jp
firstname-lastname@example.com
unusually.long.long.name@example.com

   * Невалидни email адреси:
#@%^%#$@#$@#.com
@example.com
myemail
Joe Smith <email@example.com>
email.example.com
email@example@example.com
.email@example.com
email.@example.com
email..email@example.com
email@-example.com
email@example..com
Abc..123@example.com
(),:;<>[\]@example.com
just"not"right@example.com
this\ is"really"not\allowed@example.com
