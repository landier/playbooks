build:
	docker build -t playbooks . -f docker/Dockerfile

run:
	docker run -it --rm --volume $$PWD:/playbooks --workdir /playbooks playbooks