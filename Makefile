.PHONY: clean
default: fetch

testfile := python-2.7.2-macosx10.6.dmg

fetch: 
	curl -LO https://www.python.org/ftp/python/2.7.2/python-2.7.2-macosx10.6.dmg

test-python2: $(testfile)
	time python2 ./speed-python.py python-2.7.2-macosx10.6.dmg

test-python3: $(testfile)
	time python3 ./speed-python.py python-2.7.2-macosx10.6.dmg

build-go: speed-go $(testfile)
	go build -o speed-go ./speed.go

test-go: build-go
	time ./speed-go python-2.7.2-macosx10.6.dmg

clean:
	${RM} python-2.7.2-macosx10.6.dmg speed-go
