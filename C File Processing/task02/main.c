/* Реализирайте команда head без опции (т.е. винаги да извежда на стандартния изход само първите 10 реда от съдържанието на файл подаден като първи параматър) */

#include <err.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main (int argc, char* argv[]) {
	if (argc != 2) {
		errx(1, "There must be 1 argument!");
	}

	int fd1;

    if ((fd1 = open(argv[1], O_RDONLY)) == -1) {
        err(2, "Unable to open file %s for read!", argv[1]);
    }

    char c;
    int cnt = 0;
    ssize_t read_size;
    int written;
    int oldErrno;

	while ((read_size = read(fd1, &c, sizeof(c))) > 0) {
		if (c == '\n') {
			cnt = cnt + 1;
		}
        
		if ((written = write(1, &c, read_size)) != read_size) {
			oldErrno = errno;
        	close(fd1);
        	errno = oldErrno;
            err(2, "Error while writing to temp file!");
        }

		if (cnt == 10) {
			break;
		}
	}
	if (read_size == -1) {
		oldErrno = errno;
		close(fd1);
		errno = oldErrno;
		err(1, "Cannot read from %s!", argv[1]);
	}

	close(fd1);
	exit(0);
}
