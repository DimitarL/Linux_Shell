#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int main (int argc, char** argv) {
	if (argc != 3) {
		errx(1, "There must be 2 argumens!");
	}

	int fd1;
	
	if ((fd1 = open(argv[1], O_RDWR)) == -1) {
		err(2, "Unable to open file %s for read/write!", argv[1]);
	}

	int fd2;
	int oldErrno;
	
	if ((fd2 = open(argv[2], O_RDWR)) == -1) {
		oldErrno = errno;
		close(fd1);
		close(fd2);
		errno = oldErrno;
		err(3, "Unable to open file %s for read/write!", argv[2]);
	}

	int fd3;

	if ((fd3 = open("temp_File", O_CREAT | O_RDWR | O_TRUNC, 0666)) == -1) {
		oldErrno = errno;
		close(fd1);
		close(fd2);
		close(fd3);
		errno = oldErrno;
		err(4, "Unable to open for read/wrtie or create %s!", "temp_File");
	}

	if (unlink("temp_File") == -1) {
		oldErrno = errno;
        close(fd1);
        close(fd2);
        close(fd3);
        errno = oldErrno;
		err(5, "Unable to delete temp file!");
	}

	char c[4096];
	ssize_t readSize;
	int written;

	while ((readSize = read(fd1, c, sizeof(c))) > 0) {
		if ((written = write(fd3, c, readSize)) != readSize) {
			oldErrno = errno;
			close(fd1);
			close(fd2);
			close(fd3);
			errno=oldErrno;
			err(6, "Error while writing to temp file!");
		}
	}
    if (readSize == -1) {
	    oldErrno = errno;
        close(fd1);
        close(fd2);
        close(fd3);
        errno = oldErrno;
        err(6, "Unable to read from %s", argv[1]);
    }

	lseek(fd1, 0, SEEK_SET);
	ftruncate(fd1, 0);

	while ((readSize = read(fd2, c, sizeof(c))) > 0) {
		if ((written = write(fd1, c, readSize)) != readSize) {
			oldErrno = errno;
			close(fd1);
			close(fd2);
			close(fd3);
			errno = oldErrno;
			err(7, "Error while writing to %s", argv[1]);
		}
	}
	if (readSize == -1) {
        oldErrno = errno;
        close(fd1);
        close(fd2);
        close(fd3);
        errno = oldErrno;
		err(7, "Unable to read from %s", argv[2]);
	}

	lseek(fd2, 0, SEEK_SET);
	ftruncate(fd2, 0);
	lseek(fd3, 0, SEEK_SET);
	
	while ((readSize = read(fd3, c, sizeof(c))) > 0) {
        if ((written = write(fd2, c, readSize)) != readSize) {
        	oldErrno = errno;
		    close(fd1);
            close(fd2);
            close(fd3);
            errno = oldErrno;
            err(7, "Error while writing to %s", argv[2]);
        }
	}
	if (readSize == -1) {
        oldErrno = errno;
        close(fd1);
        close(fd2);
        close(fd3);
		errno = oldErrno;
		err(8, "Unable to read from %s!", "temp_File");
	}

	close(fd1);
	close(fd2);
	close(fd3);

	exit(0);
}
