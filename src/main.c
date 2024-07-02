#include "../timer.h"

int	main(int argc, char *argv[], char *env[])
{
	struct timespec tp;
	size_t			start;
	size_t			end;

	check_args(argc, argv);

	for (int i = 1; i < argc; i++)
	{
		clock_gettime(CLOCK_MONOTONIC, &tp);
		start = (tp.tv_sec * 10e6) + tp.tv_nsec;

		if (fork() == 0)
		{
			close(STDOUT_FILENO);
			execve(argv[i], &argv[i], env);
		}

		wait(NULL);
		clock_gettime(CLOCK_MONOTONIC, &tp);
		end = (tp.tv_sec * 10e6) + tp.tv_nsec;

		printf("%s: %f \n", argv[i], (end - start) / 10e6);
	}

	return (0);
}

void	check_args(int argc, char **argv)
{
	(void)argv;
	if (argc == 1)
	{
		fprintf(stderr, "provide pathname\n");
		exit (errno);
	}
}
