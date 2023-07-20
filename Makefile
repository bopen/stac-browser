.DEFAULT_GOAL := dev

IMAGE = webportal
REGISTRY := 926s4ys1.gra7.container-registry.ovh.net/hedp
CATALOGUE_URL := "http://localhost:8000"

dev:
	@echo "Catalogue URL is $(CATALOGUE_URL)"
	npm start -- --open --catalogUrl=$(CATALOGUE_URL) --locale=en --supportedLocales en

docker-run:
	docker run --rm -ti -v $(PWD):/srv $(REGISTRY)/$(IMAGE)

docker-build:
	docker build --build-arg catalogURL=https://hedp-dev.bopen.eu/api/stac/v1/ -t $(REGISTRY)/$(IMAGE) .

docker-push:
	docker push $(REGISTRY)/$(IMAGE)

docker-login:
	docker login $(REGISTRY)
