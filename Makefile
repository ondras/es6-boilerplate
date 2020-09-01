BIN := $(shell npm bin)
LESSC := $(BIN)/lessc
ROLLUP := $(BIN)/rollup
GCC := $(BIN)/google-closure-compiler

ALL := app.js app.css
MIN := app.min.js

all: $(ALL)
min: $(MIN)

$(BIN)/%:
	npm i

app.css: $(shell find css -name '*.css' -or -name '*.less') | $(LESSC)
	$(LESSC) css/app.less > $@

app.js: $(shell find js -name '*.js') | $(ROLLUP)
	$(ROLLUP) -c -i js/app.js > $@

app.min.js: app.js | $(GCC)
	$(GCC) --language_out=ECMASCRIPT5 --js $^ > $@

clean:
	rm -rf $(ALL) $(MIN) node_modules

watch: all
	while inotifywait -e MODIFY -r css js ; do $(MAKE) $^ ; done

.PHONY: all watch clean

.DELETE_ON_ERROR:
