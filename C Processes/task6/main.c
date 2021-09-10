/* Да се напише програма на С, която получава като параметър команда (без параметри) и при успешното ѝ изпълнение, извежда на стандартния изход името на командата. */

#include <err.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>

int main (int argc, char* argv[]) {
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}
	
	int status;
	int pid = fork();

	if (pid > 0) {
		wait(&status);
		if ( WIFEXITED(status) ) {
			if ( WEXITSTATUS(status) == 0) {
				printf("%s\n", argv[1]);
			}
		}
	} else {
		if (execlp(argv[1], argv[1], (char *)NULL) == -1) {
			err(2, "Exec failed!");
		}
	}

	exit(0);
}
