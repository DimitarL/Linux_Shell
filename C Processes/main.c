#include <stdio.h>
#include <stdint.h>

int main() {
	uint8_t i;
	uint16_t count = 0;

	for(i=10; i != 0; i--) {
		count++;
	}
	count++;
	for(i = 100; i < 300; i++) {
		count++;
	}

	printf("couunt is: %d", count);
}
