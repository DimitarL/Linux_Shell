/* Да се напише програма на C, която изпълнява команда sleep (за 60 секунди). */

#include <unistd.h>
#include <stdlib.h>
#include <err.h>
#include <stdio.h>

int main() {
	if (execl("/bin/sleep", "pesho", "60", (char *)NULL) == -1) {
		err(1, "Error executing command sleep!");
	} else {
		printf("foobar\n");
	}

	exit(0);
}
