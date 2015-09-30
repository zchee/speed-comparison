.PHONY: clean
default: python-2.7.2-macosx10.6.dmg

# Color echo
__BLACK = \033[0;30m
__RED = \033[0;31m
__GREEN = \033[0;32m
__YELLOW = \033[0;33m
__BLUE = \033[0;34m
__MAGENTA = \033[0;35m
__CYAN = \033[0;36m
__WHITE = \033[0;37m
__END = \033[0;m

python-2.7.2-macosx10.6.dmg:
	@echo "$(__BLUE)Fetch $(__YELLOW)python-2.7.2-macosx10.6.dmg$(__END) $(__BLUE)test file.$(__END)"
	@echo "$(__BLUE)Total size 18M. Please wait...$(__END)"
	curl -LO https://www.python.org/ftp/python/2.7.2/python-2.7.2-macosx10.6.dmg
	@echo "$(__BLUE)Ready to any test.$(__END)"

clean:
	@rm -f python-2.7.2-macosx10.6.dmg speed-go speed-c

test-python: python-2.7.2-macosx10.6.dmg
	time python2 ./speed.py

test-python3: python-2.7.2-macosx10.6.dmg
	time python3 ./speed.py3

speed-go: python-2.7.2-macosx10.6.dmg
	go build -o speed-go ./speed.go

test-go: speed-go
	time ./speed-go python-2.7.2-macosx10.6.dmg

speed-c: python-2.7.2-macosx10.6.dmg
	${CC} -Ofast -arch x86_64 -o speed-c speed.c

test-c: speed-c
	time ./speed-c python-2.7.2-macosx10.6.dmg
