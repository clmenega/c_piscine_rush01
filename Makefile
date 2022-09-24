T			:=	test/test.py
S			:=	src/
I			:=	header/
O			:=	obj/

NAME		:=	rush-01
SRC			:=	$(addprefix $S, main.c)
OBJ			:=	$(SRC:$S%.c=$O%.o)

LIBNAME		:=	librush-01.dylib
LIBSRC		:=	$(addprefix $S, librush-01.c)
LIBOBJ		:=	$(LIBSRC:$S%.c=$O%.o)
LIBFLAGS	+=	-fPIC -shared

CC			:=	cc

CFLAGS		+=	-I$I
CFLAGS		+=	-Wall -Wextra -Werror -MMD

LDFLAGS		+=	-L.
LDLIBS		+=	-lrush-01

RM			:=	/bin/rm -f
RMDIR		:=	/bin/rm -Rf

MAKEFLAGS	+= --no-print-directory

$O%.o: $S%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

all:
	@$(MAKE) $(NAME)

lib: $(LIBOBJ)
	$(CC) $(LIBFLAGS) $(LIBOBJ) -o $(LIBNAME)

$(NAME): lib $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@ $(LDLIBS)

test: lib
	python3 $T

clean:
	$(RMDIR) $(wildcard $(NAME).dSYM)
	$(RMDIR) $O

fclean: clean
	$(RM) $(NAME) $(LIBNAME)

re: fclean
	@$(MAKE)

.PHONY: all lib test clean fclean re

-include $(OBJ:.o=.d)
