CSS_DIR = data/css
JS_DIR = data/js

JQUERY_VERSION ?= 2.1.1
JQUERY_JS ?= jquery-$(JQUERY_VERSION).min.js
FULL_JQUERY_JS = $(JS_DIR)/vendor/$(JQUERY_JS)

CSS_FILES = $(CSS_DIR)/octoaudit.css
JS_FILES = $(JS_DIR)/octoaudit.js $(FULL_JQUERY_JS)

COFFEE ?= coffee
RM ?= rm -f
SCSS ?= scss
WGET ?= wget

all: $(CSS_FILES) $(JS_FILES)

%.css: %.scss
	$(SCSS) $< $@

%.js: %.coffee
	$(COFFEE) -c $<

$(FULL_JQUERY_JS):
	$(WGET) -O $@ https://code.jquery.com/$(JQUERY_JS)

clean:
	$(RM) $(CSS_FILES) $(JS_FILES)

.PHONY: all clean
