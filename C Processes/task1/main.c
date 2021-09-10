/* Да се напише програма на C, която изпълнява команда date. */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <err.h>

int main () {
	if(execl("/bin/date", "date", (char *)NULL) == -1) {
		err(1, "Could not execute command date!");
	} else {
			printf("foobar\n");
	}

	exit(0);
}
