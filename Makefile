all: libFoo.so libFoo.so.1 libFoo.so.1.0 libBar.so libBar.so.1 libBar.so.1.0 libBaz.so libBaz.so.1 libBaz.so.1.0 main mainArg

main: main.cc Plugin
	g++ -o main -W -Wshadow -Wall -rdynamic -Os -std=c++14 -ldl -g main.cc

mainArg: mainArg.cc Plugin
	g++ -o mainArg -W -Wshadow -Wall -rdynamic -Os -std=c++14 -ldl -g mainArg.cc

Foo.o: Foo.cc Plugin
	g++ -W -fPIC -Wshadow -Wall -Os -g -std=c++14 -c -o Foo.o Foo.cc

libFoo.so.1.0: Foo.o
	g++ -shared -Wl,-soname,libFoo.so.1 -o libFoo.so.1.0 Foo.o

libFoo.so.1: libFoo.so.1.0
	ln -sf libFoo.so.1.0 libFoo.so.1

libFoo.so: libFoo.so.1
	ln -sf libFoo.so.1 libFoo.so

Bar.o: Bar.cc Plugin
	g++ -W -fPIC -Wshadow -Wall -Os -g -std=c++14 -c -o Bar.o Bar.cc

libBar.so.1.0: Bar.o
	g++ -shared -Wl,-soname,libBar.so.1 -o libBar.so.1.0 Bar.o

libBar.so.1: libBar.so.1.0
	ln -sf libBar.so.1.0 libBar.so.1

libBar.so: libBar.so.1
	ln -sf libBar.so.1 libBar.so

Baz.o: Baz.cc Plugin
	g++ -W -fPIC -Wshadow -Wall -Os -g -std=c++14 -c -o Baz.o Baz.cc

libBaz.so.1.0: Baz.o
	g++ -shared -Wl,-soname,libBaz.so.1 -o libBaz.so.1.0 Baz.o

libBaz.so.1: libBaz.so.1.0
	ln -sf libBaz.so.1.0 libBaz.so.1

libBaz.so: libBaz.so.1
	ln -sf libBaz.so.1 libBaz.so

clean:
	rm -f libBar.so libBar.so.1 libBar.so.1.0 Bar.o libFoo.so libFoo.so.1 libFoo.so.1.0 Foo.o main mainArg Baz.o libBaz.so libBaz.so.1 libBaz.so.1.0
