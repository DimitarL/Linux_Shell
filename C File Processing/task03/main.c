// Реализирайте команда wc, с един аргумент подаден като входен параметър

#include <err.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main (int argc, char* argv[]) {
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}

	int fd1;

	if ((fd1 = open(argv[1], O_RDONLY)) == -1) {
		err(2, "Can't open %s for read!", argv[1]);
	}

    char c;
    int lines=0;
    int words=0;
    int chars=0;

	while ((read(fd1, &c, 1)) > 0) {
		if (c == '\n') {
			lines++;
			words++;
		} else if (c == ' ') {
			words++;
		}
		chars++;
	}
	
	printf("File %s has:\n%d number of lines.\n%d number of words.\n%d number of chars.\n", argv[1], lines, words, chars);

	close(fd1);
	exit(0);
}
