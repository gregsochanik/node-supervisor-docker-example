help:
	@echo "run_image accepts ENV parameter (dev|uat|prod)"

build_image:
	docker build -t node-superv .

ENV="dev"
PORT=3000
NAME="web00"

run_image:
	@echo $(ENV)
	docker run --name $(NAME) -d -p $(PORT):3000 -v $(shell pwd)/supervisor/$(ENV):/supervisor node-superv

run_all:
	make run_image ENV=$(ENV) PORT=3000 NAME="web00"
	make run_image ENV=$(ENV) PORT=3001 NAME="web01"
