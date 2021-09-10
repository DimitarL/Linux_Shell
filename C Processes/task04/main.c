/* Да се напише програма на C, която създава процес дете и демонстрира принцина на конкурентност при процесите. */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main () {
	int n = 10;
	int m = 30;

	if (fork() > 0) {
		for (int i = 0; i < n; i++) {
			printf("father\n");
		}
	} else {
		for (int i = 0; i < m; i++) {
			printf("son\n");
		}
	}

	exit(0);
}
