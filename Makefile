DST_PATH=./html

ASCII=asciidoc
ASCII_CONF=./layout1.conf
ASCII_ARGS=--unsafe --backend=xhtml11 --conf-file=$(ASCII_CONF)

PAGES=articles.ascii contacts.ascii \
	index.ascii links.ascii people.ascii projects.ascii theses.ascii

TARGETS=$(PAGES:%.ascii=html/%.html)

all: $(TARGETS)

source/theses.ascii: $(shell find html/theses -type f) ./theses_update.sh
	./theses_update.sh > $@

$(TARGETS): ./html/%.html: source/%.ascii
	$(ASCII) $(ASCII_ARGS) --out-file=$@ $<

update:
	git pull
	make

clean:
	rm html/*.html source/theses.ascii

.PHONY: all clean update
