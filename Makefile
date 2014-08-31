build:
	docker build -t texastribune/sputnik .

run: clean
	docker run -p 5111:5111 -p 1957:1957 -p 554:554 --detach --name sputnik \
	  texastribune/sputnik

shell:
	docker run --rm -i -t --name debug texastribune/sputnik /bin/bash

conf: run
	docker cp sputnik:/data/conf .
	docker stop sputnik
	docker rm sputnik

clean:
	-docker rm sputnik 2> /dev/null
