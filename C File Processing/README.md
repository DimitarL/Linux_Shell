Въведение  
scp, sftp, WinSCP2  
Няколко думи за C
Как да компилираме

    gcc -std=c99 -Werror -Wall -Wpedantic -Wextra -o foo main.c
    ... -pedantic
    ./foo
    Makefile

Няколко думи за памет и pointer-и

    xxd
    little/big endianness
    binary file
    char*
    malloc(3) void *malloc(size_t size);
    free(3) void free(void *ptr);

Системни примитиви
man man - секция 3, Library calls (functions within program libraries)

* exit(3)

* man man - секция 2, System calls (functions provided by the kernel)

* open(2) int open(const char *pathname, int flags);

* close(2) int close(int fd);

* read(2) ssize_t read(int fd, void *buf, size_t count);

* write(2) ssize_t write(int fd, const void *buf, size_t count);

   * T1 - Копирайте съдържанието на файл1 във файл2

* int main(int argc, char* argv[])

   * T2 - Реализирайте команда head без опции (т.е. винаги да извежда на стандартния изход само първите 10 реда от съдържанието на файл подаден като първи параматър)

* fprintf(3)

   * T3 - Реализирайте команда wc, с един аргумент подаден като входен параметър

* err(3)

* lseek(2)

   * T4 - Реализирайте команда swap, разменяща съдържанието на два файла, подадени като входни параметри.
