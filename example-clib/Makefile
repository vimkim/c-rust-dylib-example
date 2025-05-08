all: libexample.so

libexample.so: example.c
	gcc -O3 -g -fPIC -shared -o libexample.so example.c

clean:
	rm -f *.so test

