build:
	cd apps/one; make build
	cd apps/two; make build
	cd apps/three; make build

push:
	cd apps/one; make push
	cd apps/two; make push
	cd apps/three; make push

deps:
	cd apps/one; mix do deps.get, deps.compile
	cd apps/two; mix do deps.get, deps.compile
	cd apps/three; mix do deps.get, deps.compile
