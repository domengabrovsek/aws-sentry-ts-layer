.PHONY: build-SentryLayer
.PHONY: build-AWSLayer
.PHONY: build-Lambdas

build-Lambdas:
	$(MAKE) HANDLER=src/app.ts build-lambda-common

build-lambda-common:
	npm install
	rm -rf dist
	echo "{\"extends\": \"./tsconfig.json\", \"include\": [\"${HANDLER}\"] }" > tsconfig-only-handler.json
	npm run build -- --build tsconfig-only-handler.json
	cp -r dist "$(ARTIFACTS_DIR)/"

build-SentryLayer:
	mkdir -p "$(ARTIFACTS_DIR)/nodejs"
	cp lambda-layers/SentryLayer/package.json "$(ARTIFACTS_DIR)/nodejs/"
	npm install --production --prefix "$(ARTIFACTS_DIR)/nodejs/"
	rm "$(ARTIFACTS_DIR)/nodejs/package.json" 

build-AWSLayer:
	mkdir -p "$(ARTIFACTS_DIR)/nodejs"
	cp lambda-layers/AWSLayer/package.json "$(ARTIFACTS_DIR)/nodejs/"
	npm install --production --prefix "$(ARTIFACTS_DIR)/nodejs/"
	rm "$(ARTIFACTS_DIR)/nodejs/package.json" 

build-AxiosLayer:
	mkdir -p "$(ARTIFACTS_DIR)/nodejs"
	cp lambda-layers/AxiosLayer/package.json "$(ARTIFACTS_DIR)/nodejs/"
	npm install --production --prefix "$(ARTIFACTS_DIR)/nodejs/"
	rm "$(ARTIFACTS_DIR)/nodejs/package.json" 