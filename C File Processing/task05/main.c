/* Реализирайте команда cat, работеща с произволен брой подадени входни параметри. */

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <err.h>
#include <errno.h>

int main (int argc, char* argv[]) {
	int size = argc - 1;

	for (int i = 1; i <= size; i++) {
		int fd;		

		if ((fd = open(argv[i], O_RDONLY)) == -1) {
			err(1, "Failed to open file %s for read!", argv[i]);
		}

    	char c[2048];
    	ssize_t readSize;
   		int written;
	    int oldErrno;

		while ((readSize = read(fd, c, sizeof(c))) > 0) {
			if ((written = write(1, c, readSize)) == -1) {
				oldErrno = errno;
				close(fd);
				err(2, "Failed to write to %s!", argv[i]);
			}
		}
		if (readSize == -1) {
			oldErrno = errno;
			close(fd);
			errno = oldErrno;
			err(3, "Failed to read from %s!", argv[i]);
		}

		close(fd);
	}

	exit(0);
}
