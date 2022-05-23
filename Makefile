# Make file to generate documentation

SOURCE     = source
OUT        = build
BUILD      = python3 -m sphinx
OPTS       =-c .

help:
	@$(BUILD) -M help "$(SOURCE)" "$(OUT)" $(OPTS)

multiversion: Makefile
	sphinx-multiversion $(OPTS) "$(SOURCE)" build/html
	@echo "<html><head><meta http-equiv=\"refresh\" content=\"0; url=humble/index.html\" /></head></html>" > build/html/index.html

.PHONY: help Makefile multiversion

%: Makefile
	@$(BUILD) -M $@ "$(SOURCE)" "$(OUT)" $(OPTS)

test:
	doc8 --ignore D001 --ignore-path build
