# vim:ft=make

.PHONY: doc
doc: reset_state copy_content
	docpress build

.PHONY: reset_state
reset_state:
	command -v docpress > /dev/null || npm install docpress
	test -d ./docs && rm -rf ./docs || true

.PHONY: copy_content
copy_content:
	mkdir ./docs
	cp ./toc.md docs/README.md
	cp ./notes/* ./docs/
	cp ./vault/readme.md ./docs/vault.md
	cp ./flarum/readme.md ./docs/flarum.md
#
