/* Да се напише програма на C, която е аналогична на горния пример, но принуждава бащата да изчака сина си да завърши. */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>

int main () {
	int n = 30;
	int status;
	int pid = fork();

	if (pid > 0) {
		wait(&status);
		printf("status is %d\n", status);
		for (int i = 0; i < n; i++) {
			printf("father\n");
		}
	} else {
		for (int i = 0; i < n; i++) {
			printf("son\n");
			printf("status is %d\n", status);
			exit(0);
		}
	}

	exit(0);
}
