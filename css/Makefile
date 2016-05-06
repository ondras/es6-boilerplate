LESSC_BIN := ../node_modules/.bin/lessc
MAIN := app.css

$(MAIN): $(shell find src -name '*.css' -or -name '*.less')
	$(LESSC_BIN) src/app.less $@

clean:
	rm -rf $(MAIN)

.PHONY: all clean
