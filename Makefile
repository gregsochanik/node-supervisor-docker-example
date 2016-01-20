build_image:
	docker build -t node-superv .

run_image:
	docker run -d -p 80:3000 node-superv
