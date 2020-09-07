BIN := $(shell npm bin)
TSC := $(BIN)/tsc
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

app.js: js/.tsflag | $(ROLLUP)
	$(ROLLUP) -c -i js/app.js > $@

app.min.js: app.js | $(GCC)
	$(GCC) --language_out=ECMASCRIPT5 --js $^ > $@

js/.tsflag: $(shell find ts -name '*.ts')
	$(TSC) -p ts
	@touch $@

clean:
	rm -rf $(ALL) $(MIN) js node_modules

watch: all
	while inotifywait -e MODIFY -r css ts ; do $(MAKE) $^ ; done

.PHONY: all watch clean

.DELETE_ON_ERROR:
