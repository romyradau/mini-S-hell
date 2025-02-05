NAME = minishell

FILES = 0_minishell.c 1_process_package.c 2_get_command.c 3_allocate_redirections.c 4_quote_rules.c \
		5_clean_expand.c 6_expand.c 7_redirections.c 8_heredoc.c 9_execute_packages.c \
		10_do_the_execution.c 11_free_all.c 12_get_exit_status.c\
		special_pipe_split.c special_cmd_split.c helpers.c\
		./utils/sig_handls.c ./utils/builtins.c ./utils/ft_echo.c ./utils/ft_exe_cd.c ./utils/ft_exit.c \
		./utils/ft_env_func.c ./utils/ft_export_func.c ./utils/builtin_tools/list_tools.c ./utils/builtin_tools/handle_string.c \
		./utils/builtin_tools/env_tools.c ./utils/builtin_tools/list_del_tools.c ./utils/builtin_tools/export_tools.c ./utils/builtin_tools/signal_tools.c

LDFLAGS		= -L/$(HOME)/.brew/opt/readline/lib -lreadline
CPPFLAGS	= -I/$(HOME)/.brew/opt/readline/include

CC = gcc

CFLAGS = $(LDFLAGS) $(CPPFLAGS) -Wall -Wextra -Werror -g

OBJ := $(FILES:.c=.o)

LINKED_OBJ = ./libft/*.o

%.o: %.c
	@$(CC) -Wall -Wextra -Werror -g $(CPPFLAGS) $(INC) -o $@ -c $<
	@echo compiled $@

all: linked_objects $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ) $(LINKED_OBJ) -lreadline
	
linked_objects: 
	make -C ./libft
#(FILE) as dependencya added, so changes in file are noticed and changed:)

fclean:
	rm -f $(NAME) ./libft/*.o ./libft/*.a $(OBJ)

make re: fclean all