BIN := node_modules/.bin
LESSC := $(BIN)/lessc
ROLLUP := $(BIN)/rollup
BABEL := $(BIN)/babel
ALL := app.js app.css polyfills.js

all: $(ALL)

app.css: $(shell find css -name '*.css' -or -name '*.less')
	$(LESSC) css/app.less > $@

app.js: $(shell find js -name '*.js')
	$(ROLLUP) -c -i js/app.js | $(BABEL) -f $@ > $@

polyfills.js: polyfills/*.js
	cat $^ > $@

clean:
	rm -rf $(ALL)

watch: all
	while inotifywait -e MODIFY -r css js ; do make $^ ; done

.PHONY: all watch clean

.DELETE_ON_ERROR:
