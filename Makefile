build_image:
	docker build -t node-superv .

run_image_dev:
	docker run -d -p 80:3000 -v $(shell pwd)/supervisor/dev:/supervisor node-superv

run_image_uat:
	docker run -d -p 80:3000 -v $(shell pwd)/supervisor/uat:/supervisor node-superv

run_image_prod:
	docker run -d -p 80:3000 -v $(shell pwd)/supervisor/prod:/supervisor node-superv

