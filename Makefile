ES6_EXT = js
ES5_EXT = js5
ES6_FILES = $(shell find js -name '*.$(ES6_EXT)')
ES5_FILES = $(patsubst %.$(ES6_EXT),%.$(ES5_EXT),$(ES6_FILES))

all: app.js app.css

watch: all
	while inotifywait -r js ; do make $^ ; done

app.css: $(wildcard css/*)
	lessc css/app.less $@

app.js: $(ES5_FILES)
	cat $^ > $@
	echo "System.import('js/app');" >> $@

%.$(ES5_EXT): %.$(ES6_EXT)
	babel -M --modules system $< > $@

.PHONY: all watch
