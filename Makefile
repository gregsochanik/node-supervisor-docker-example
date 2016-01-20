help:
	@echo "run_image accepts ENV parameter (dev|uat|prod)"

build_image:
	docker build -t node-superv .

ENV="dev"
PORT=3000

run_image:
	@echo $(ENV)
	docker run -d -p $(PORT):3000 -v $(shell pwd)/supervisor/$(ENV):/supervisor node-superv

