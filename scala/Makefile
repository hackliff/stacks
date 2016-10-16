# Makefile
# vim:ft=make

container:
	docker build --rm -t local/scala .

.PHONY: scala
scala: container
	docker run -it --rm local/scala

.PHONY: container
lab: container
	docker run -it --rm -v $(PWD):/app -w /app local/scala bash
