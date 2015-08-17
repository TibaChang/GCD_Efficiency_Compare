#include <inttypes.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <time.h>


extern int get_gcd(int big, int small);

int main(int argc, char **argv)
{
	
	int result = 0;
	//double elapsed_avg_nsec = 0;
	uint64_t nsec1 = 0;
	uint64_t nsec2 = 0;
	uint64_t elapsed_nsec = 0;
	uint64_t total_time_for_one = 0;
	//double final_time_sum = 0;
	//double final_avg_time = 0;
	struct timespec t_start, t_end;
	FILE *file = fopen("./result.txt", "a");

	if (file) {
		int big, small;
		
		//int i = 0;
		for (big = 9999; big > 9900; big--) {
			total_time_for_one = 0;
			for (small = 2; big>small; small++) { 
				//final_avg_time = 0;

					nsec1 = 0;
					nsec2 = 0;
					elapsed_nsec = 0;
					clock_gettime(CLOCK_MONOTONIC, &t_start);
					nsec1 = (uint64_t)(t_start.tv_sec) * 1000000000LL + t_start.tv_nsec;
					result = get_gcd(big, small);
					clock_gettime(CLOCK_MONOTONIC, &t_end);
					
					nsec2 = (uint64_t)(t_end.tv_sec) * 1000000000LL + t_end.tv_nsec;
					//printf("%" PRIu64 "\n", nsec1);
					//printf("%" PRIu64 "\n", nsec2);
					elapsed_nsec = nsec2 - nsec1;
					//elapsed_avg_nsec = (double)elapsed_nsec;

				
				//final_avg_time = (final_time_sum / repeat_time );//get average time of repeat_time*10 times
				total_time_for_one += elapsed_nsec;
				printf("big=%d small=%d gcd=%d %" PRIu64 "\n", big,small,result,elapsed_nsec);
			}
			fprintf(file, "%d %" PRIu64 "\n", big, total_time_for_one);
		}

		fclose(file);

	} else {
		printf("Open file error!\n");
	}
	return 0;

}

