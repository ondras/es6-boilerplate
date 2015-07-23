MAIN = app.css

$(MAIN): $(shell find src -name '*.css' -or -name '*.less')
	lessc src/app.less $@

clean:
	rm -rf $(MAIN)

.PHONY: all clean
