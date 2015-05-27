DIR_JS = js/app
DIR_LIB = js/lib
DIR_ES5 = js/_es5
DIR_CSS = css

CSS_FILES = $(shell find $(DIR_CSS) -name '*.css' -or -name '*.less')
JS_FILES = $(shell find $(DIR_JS) -name '*.js')

all: all.js all.css

watch: all
	while inotifywait -e MODIFY -r $(DIR_JS) $(DIR_LIB) $(DIR_CSS) ; do make $^ ; done

all.css: $(CSS_FILES)
	lessc $(DIR_CSS)/app.less $@

all.js: $(shell find $(DIR_LIB) -name '*.js') $(addprefix $(DIR_ES5)/,$(JS_FILES))
	cat $^ > $@
	echo "System.import('js/app/app').catch(console.error.bind(console));" >> $@

$(DIR_ES5)/%: %
	mkdir -p $(dir $@)
	babel -M --modules system $< > $@

clean:
	rm -f all.js all.css $(DIR_ES5)

.PHONY: all watch clean
