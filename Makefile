GREEN = \e[0;32m
BLUE = \e[1;034m
RED = \e[0;31m
MAGENTA = \033[1;35m
ORANGE = \033[1;38;5;208m
GREY = \033[0;37m
RESET = \e[0m

NAME = timer
CC = cc
CFLAGS = -Wall -Wextra -Werror
CFILES = main.c
OBJS_DIR = ./objs/
RM = rm -f
OBJS = ${addprefix ${OBJS_DIR}, ${CFILES:.c=.o}}

VPATH = src

all: ${NAME}

${NAME}: ${OBJS}
	@${CC} ${CFLAGS} ${OBJS} -o $@

${OBJS_DIR}:
	mkdir $@

${OBJS}: | ${OBJS_DIR}

${OBJS_DIR}%.o: %.c
	@${CC} ${CFLAGS} -c $^ -o $@

clean:
	rm -rf ${OBJS}
	rm -rf ${OBJS_DIR}

fclean: clean
	rm -rf ${NAME}

re: fclean ${NAME}

.SILENT:

.PHONY: clean re fclean
