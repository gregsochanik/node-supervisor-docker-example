help:
	@echo "run_image accepts ENV parameter (dev|uat|prod)"

build_image:
	docker build -t node-superv .

ENV="dev"
PORT=3000
NAME="web00"

run_image:
	@echo $(ENV)
	docker run --name $(NAME) -d -e INSTANCE_NAME=$(NAME) -v $(shell pwd)/supervisor/$(ENV):/supervisor node-superv

run_all:
	make run_image ENV=$(ENV) NAME="web00"
	make run_image ENV=$(ENV) NAME="web01"
	make compile_upstream
	docker run --name docker-nginx --link web00:web00 --link web01:web01 -p 80:80 -v `pwd`/nginx/conf.d/:/etc/nginx/conf.d/ -d nginx

define API_UPSTREAM
upstream api_servers {
	server $(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' web00):3000;
	server $(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' web01):3000;
}
endef
export API_UPSTREAM

compile_upstream:
	@echo "$$API_UPSTREAM" > `pwd`/nginx/conf.d/api_upstream.conf

kill_all: 
	-docker rm -f docker-nginx
	-docker rm -f web00
	-docker rm -f web01
