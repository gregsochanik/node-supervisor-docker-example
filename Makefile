help:
	@echo "run_image accepts ENV parameter (dev|uat|prod)"

build_image:
	docker build -t node-superv .

ENV="dev"
PORT=3000
NAME="web00"

run_image:
	@echo $(ENV)
	docker run --name $(NAME) -d -v $(shell pwd)/supervisor/$(ENV):/supervisor node-superv

run_all:
	make run_image ENV=$(ENV) NAME="web00"
	make run_image ENV=$(ENV) NAME="web01"
	docker run --name docker-nginx --link web00:web00 --link web01:web01 -p 80:80 -v `pwd`/docker-nginx/nginx.conf:/etc/nginx/nginx.conf -d nginx
