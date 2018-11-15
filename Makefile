export PATH := node_modules/.bin:$(PATH)
ALL := app.js app.css polyfills.js

all: $(ALL)

app.css: $(shell find css -name '*.css' -or -name '*.less')
	lessc css/app.less > $@

app.js: $(shell find js -name '*.js')
	rollup -c -i js/app.js | babel -f $@ > $@

polyfills.js: polyfills/*.js
	cat $^ > $@

clean:
	rm -rf $(ALL)

watch: all
	while inotifywait -e MODIFY -r css js ; do make $^ ; done

.PHONY: all watch clean

.DELETE_ON_ERROR:
