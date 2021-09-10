/* Да се напише програма на C, която приема аргумент - име на файл. Програмата да:
   - записва във файла 'fo'
   - създава child процес, който записва 'bar\n'
   - parent-а, след като изчака child процеса, записва 'o\n' */

#include <err.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

int main(int argc, char* argv[]) {
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}

	const int fd = open(argv[1], O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
	if (fd == -1) {
		err(2, "Can't open %s for read/write!", argv[1]);
	}

	const char* str1 = "foo\n";
	const char* str2 = "bar\n";
	int oldErrno;

	if ((write(fd, str1, 2)) != 2) {
		oldErrno = errno;
		close(fd);
		errno = oldErrno;
		err(3, "Could not write first 2 chars from '%s'!", str1);
	}

	pid_t child = fork();
	if (child == -1) {
		oldErrno = errno;
		close(fd);
		errno = oldErrno;
		err(4, "Could not fork!");
	}

	if (child == 0) {
		if (write(fd, str2, 4) != 4) {
			oldErrno = errno;
       		close(fd);
    	    errno = oldErrno;
	        err(5, "Could not write first 4 chars from '%s' in child!", str2);
		}
		exit(0);
	}

	int childStatus;
	const pid_t waitCode = wait(&childStatus);
	if (waitCode == -1) {
		oldErrno = errno;
        close(fd);
        errno = oldErrno;
        err(6, "Could not wait for child!");
	}

	if (! WIFEXITED(childStatus) != 0) {
        oldErrno = errno;
        close(fd);
        errno = oldErrno;
        err(7, "Child did not terminate normally!");
	}

	if (WEXITSTATUS(childStatus) != 0) {
		oldErrno = errno;
        close(fd);
        errno = oldErrno;
        err(8, "Child exit code was not 0!");
	}

	if (write(fd, str1+2, 2) != 2) {
        oldErrno = errno;
        close(fd);
        errno = oldErrno;
        err(9, "Could not write the last 2 cars in parent!");
	}

	close(fd);
	exit(0);
}
