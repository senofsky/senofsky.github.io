# This Makefile handles the following operations for senofsky.github.io:
#
#    - Building
#    - Rebuilding
#    - Previewing
#    - Cleaning

_site:
	stack exec site build

# Build the site
build: _site

# Rebuild the site
.PHONY: rebuild
rebuild:
	stack exec site rebuild

# Preview the site
.PHONY: preview
preview: _site
	stack exec site watch

# Remove all generated artifacts
.PHONY: clean
clean:
	stack exec site clean
