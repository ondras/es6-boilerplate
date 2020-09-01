BIN := $(shell npm bin)
LESSC := $(BIN)/lessc
ROLLUP := $(BIN)/rollup
GCC := $(BIN)/google-closure-compiler

ALL := app.js app.css
MIN := app.min.js

all: $(ALL)

app.css: $(shell find css -name '*.css' -or -name '*.less')
	$(LESSC) css/app.less > $@

app.js: $(shell find js -name '*.js')
	$(ROLLUP) -c -i js/app.js > $@

app.min.js: app.js
	$(GCC) --language_out=ECMASCRIPT5 --js $^ > $@

clean:
	rm -rf $(ALL) $(MIN)

watch: all
	while inotifywait -e MODIFY -r css js ; do $(MAKE) $^ ; done

.PHONY: all watch clean

.DELETE_ON_ERROR:
