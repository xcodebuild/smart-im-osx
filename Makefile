CC=/usr/bin/clang
NAME=im-select
INSTALL_PATH=/usr/local/bin/
OPTS=-framework foundation -framework carbon

all:
	$(CC) $(OPTS) -o $(NAME) $(NAME).m

install:$(NAME)
	cp $(NAME) $(INSTALL_PATH)

uninstall:
	rm $(INSTALL_PATH)$(NAME)
