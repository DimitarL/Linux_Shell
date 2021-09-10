/* Напишете програма на C, която демонстрира комуникация през pipe между parent и child процеси. Parent-ът трябва да изпраща стринга, получен като първи аргумент на командния ред към child-а, който да го отпечатва на стандартния изход. */

#include <stdlib.h>
#include <err.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>

int main (int argc, char* argv[] ){
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}

	int fd[2];
	if (pipe(fd) == -1) {
		err(2, "Could not create pipe!");
	}

	const pid_t childPid = fork();
	if (childPid == -1) {
		err(3, "Could not fork!");
	}

	if (childPid == 0) {
		close(fd[1]);
		char buf;
		ssize_t readSize;
		int written;
		int oldErrno;

		while ((readSize = read(fd[0], &buf, 1)) > 0) {
			if ((written = write(1, &buf, readSize)) != readSize) {
				oldErrno = errno;
            	close(fd[0]);
				close(fd[1]);
            	errno = oldErrno;
            	err(4, "Unable to write to standart output");
			}
		}
    	if (readSize == -1) {
        	oldErrno = errno;
        	close(fd[0]);
			close(fd[1]);
        	errno = oldErrno;
        	err(5, "Unable to read from fd[0]");
    	}

		close(fd[0]);
		exit(0);
	}

	/* Parent writes argv[1] to pipe */
    close(fd[0]);          /* Close unused read end */
    write(fd[1], argv[1], strlen(argv[1]));
    close(fd[1]);          /* Reader will see EOF */
    wait(NULL);            /* Wait for child */
	
	exit(0);
}
