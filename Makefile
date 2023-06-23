IMAGE = webportal
REGISTRY := 926s4ys1.gra7.container-registry.ovh.net/hedp

docker-run:
	docker run --rm -ti -v $(PWD):/srv $(REGISTRY)/$(IMAGE)

docker-build:
	docker build --build-arg catalogURL=https://hedp-dev.bopen.eu/api/stac/v1/ -t $(REGISTRY)/$(IMAGE) .

docker-push:
	docker push $(REGISTRY)/$(IMAGE)

docker-login:
	docker login $(REGISTRY)
