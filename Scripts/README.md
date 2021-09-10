# read

* 05-a-2000  
Сменете вашия prompt с нещо по желание. После върнете оригиналния обратно.
* 05-a-2100  
Редактирайте вашия .bash_profile файл, за да ви поздравява (или да изпълнява някаква команда по ваш избор) всеки път, когато влезете в системата.
* 05-a-2200  
Направете си ваш псевдоним (alias) на полезна команда.
* 05-b-2000  
Да се напише shell скрипт, който приканва потребителя да въведе низ (име) и изпечатва "Hello, низ".
* 05-b-2800  
Да се напише shell скрипт, който приема точно един параметър и проверява дали подаденият му параметър се състои само от букви и цифри.
* 05-b-3100  
Да се напише shell скрипт, който приканва потребителя да въведе низ - потребителско име на потребител от системата - след което извежда на стандартния изход колко активни сесии има потребителят в момента.
* 05-b-3200  
Да се напише shell скрипт, който приканва потребителя да въведе пълното име на директория и извежда на стандартния изход подходящо съобщение за броя на всички файлове и всички директории в нея.
* 05-b-3300  
Да се напише shell скрипт, който чете от стандартния вход имената на 3 файла, обединява редовете на първите два (man paste), подрежда ги по азбучен ред и резултата записва в третия файл.
* 05-b-3400  
Да се напише shell скрипт, който чете от стандартния вход име на файл и символен низ, проверява дали низа се съдържа във файла и извежда на стандартния изход кода на завършване на командата с която сте проверили наличието на низа.

NB! Символният низ може да съдържа интервал (' ') в себе си.
* 05-b-4200  
Имате компилируем (a.k.a няма синтактични грешки) source file на езика C. Напишете shell script, който да покaзва колко е дълбоко най-дълбокото nest-ване (влагане).
Примерен .c файл:

#include <stdio.h>

int main(int argc, char *argv[]) {

  if (argc == 1) {
		printf("There is only 1 argument");
	} else {
		printf("There are more than 1 arguments");
	}

	return 0;
}
Тук влагането е 2, понеже имаме main блок, а вътре в него if блок.

Примерно извикване на скрипта:

./count_nesting sum_c_code.c

Изход:
The deepest nesting is 2 levels
* 05-b-4300  

* 05-b-4301  

* 05-b-4400  

* 05-b-4500  

* 05-b-4600  

* 05-b-4700  

* 05-b-4800  

* 05-b-5500  

* 05-b-6600  

* 05-b-6800  

* 05-b-7000  

* 05-b-7100  

* 05-b-7200  

* 05-b-7500  

* 05-b-7550  

* 05-b-7700  

* 05-b-7800  

* 05-b-8000  

* 05-b-9100  

* 05-b-9200  

* 05-b-9500  

* 05-b-9501  

* 05-b-9600  

* 05-b-9601  