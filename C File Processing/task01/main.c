// копирайте съдържанието на файл1 във файл2
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	if (argc != 3) {
		errx(1, "There must be 2 arguments!");
	}

	int fd1;

	if ((fd1 = open(argv[1], O_RDONLY)) == -1) {
		err(2, "Failed to open %s in read mode!", argv[1]);
	}

	int fd2;
	int oldErrno;

	if ((fd2 = open(argv[2], O_CREAT | O_RDWR | O_TRUNC, 0666)) == -1) {
		oldErrno = errno;
		close(fd1);
		errno = oldErrno;
		err(3, "Failed to open %s in read mode!", argv[2]);
	}

	char c[2048];
	ssize_t readSize;
	int written;

	while ((readSize = read(fd1, c, sizeof(c))) > 0) {
		if ((written = write(fd2, c, readSize)) != readSize) {
			oldErrno = errno;
			close(fd1);
			close(fd2);
			errno = oldErrno;
			err(4, "Error while writing to %s!", argv[2]);
		}
	}
	if (readSize == -1) {
		oldErrno = errno;
		close(fd1);
		close(fd2);
		errno = oldErrno;
		err(5, "Error while reading from %s!", argv[1]);
	}

	close(fd1);
	close(fd2);
	exit(0);
}
