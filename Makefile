.PHONY: requirements
requirements:
	bundle install

.PHONY: setup
setup: clean
	git fetch origin gh-pages
	git branch -f gh-pages origin/gh-pages
	git worktree add build gh-pages

.PHONY: clean
clean:
	rm -rf build
	git worktree prune

.PHONY: build
build:
	bundle exec middleman build

.PHONY: server
server:
	bundle exec middleman server

.PHONY: publish
publish: setup build
	$(eval export LATEST_TAG=$(shell git describe --always))
	cd build && git add . && git commit --allow-empty -m "Publish documentation from ${LATEST_TAG}"
	cd build && git push origin gh-pages
