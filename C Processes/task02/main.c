/* Да се напише програма на C, която изпълнява команда ls с точно един аргумент. */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <err.h>

int main (int argc, char* argv[]) {
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}

	if (execl("/bin/ls", "ls", argv[1], (char *)NULL) == -1) {
		err(2, "Error executing command ls");
	} else {
		printf("foobar\n");
	}

	exit(0);
}
