all: libFoo.so libFoo.so.1 libFoo.so.1.0 libBar.so libBar.so.1 libBar.so.1.0 main

main: main.cc
	g++ -o main -W -Wshadow -Wall -rdynamic -Os -std=c++11 -ldl -g main.cc

Foo.o: Foo.cc
	g++ -W -fPIC -Wshadow -Wall -Os -g -std=c++11 -c -o Foo.o Foo.cc

libFoo.so.1.0: Foo.o
	g++ -shared -Wl,-soname,libFoo.so.1 -o libFoo.so.1.0 Foo.o

libFoo.so.1: libFoo.so.1.0
	ln -sf libFoo.so.1.0 libFoo.so.1

libFoo.so: libFoo.so.1
	ln -sf libFoo.so.1 libFoo.so

Bar.o: Bar.cc
	g++ -W -fPIC -Wshadow -Wall -Os -g -std=c++11 -c -o Bar.o Bar.cc

libBar.so.1.0: Bar.o
	g++ -shared -Wl,-soname,libBar.so.1 -o libBar.so.1.0 Bar.o

libBar.so.1: libBar.so.1.0
	ln -sf libBar.so.1.0 libBar.so.1

libBar.so: libBar.so.1
	ln -sf libBar.so.1 libBar.so

clean:
	rm -f libBar.so libBar.so.1 libBar.so.1.0 Bar.o libFoo.so libFoo.so.1 libFoo.so.1.0 Foo.o main
