/* Напишете програма на C, която демонстрира употребата на dup/dup2 между parent и child процеси. Parent-ът трябва да изпраща стринга, получен като първи аргумент на командния ред към child-а, където той да може да се чете от stdin. Child процесът да изпълнява wc -c */

#include <stdlib.h>
#include <err.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>

int main (const int argc, const char* argv[]) {
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}

	int fd[2];
	if (pipe(fd) == -1) {
		err(2, "Can't create pipe!");
	}

	int oldErrno;
	pid_t child = fork();

	if (child == -1) {
		oldErrno = errno;
		close(fd[0]);
		close(fd[1]);
		errno = oldErrno;
		err(3, "Can't fork");
	}

	if (child == 0) {
		close(fd[1]);
		close(0);

		if ((dup(fd[0])) == -1) {
			oldErrno = errno;
			close(fd[1]);
			errno = oldErrno;
			err(4, "Can't execute dup");
		}
		
		if (execlp("wc", "wc", "-c", (char *)NULL) == -1) {
			oldErrno = errno;
			close(fd[1]);
			errno = oldErrno;
			err(5, "Could not exec");
		}
	}

	close(fd[0]);
	write(fd[1], argv[1], strlen(argv[1]));
	close(fd[1]);
	wait(NULL);

	exit(0);
}
