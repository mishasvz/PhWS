all:
	gnat make -P phoenix
	cp -rvf build /home/misha/"Общедоступные"

clean:
	gnat clean -P phoenix
	rm -v ./build/log/*
