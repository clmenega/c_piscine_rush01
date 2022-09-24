SRCS				=		project/main.cFLAGS=-Wall -Wextra -Werror
NAME				=		rush01
CC					=		cc
O					=		obj/
RUSH_PATH			=		/tmp/rush-01/ex00


$O%.o: $(RUSH_PATH)%.c
	@mkdir -p 


all:
	$(COMPIL) $(FLAGS) $(SRCS) -o $(NAME)

clean:
	

fclean:
	/bin/rm $(NAME)
	make -C libft fclean

re: fclean all

.PHONY: all bonus clean fclean re Cub3D