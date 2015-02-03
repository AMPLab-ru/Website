DST_PATH=./html

ASCII=asciidoc
ASCII_CONF=./layout1.conf
ASCII_ARGS=--unsafe --backend=xhtml11 --conf-file=$(ASCII_CONF)

PAGES=articles.ascii contacts.ascii \
	index.ascii links.ascii people.ascii projects.ascii
TARGETS=$(PAGES:%.ascii=html/%.html)

all: $(TARGETS)

$(TARGETS): ./html/%.html: source/%.ascii
	$(ASCII) $(ASCII_ARGS) --out-file=$@ $<

clean:
	rm html/*.html

.PHONY: all
