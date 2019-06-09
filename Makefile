.PHONY: all
all: bin dotfiles

.PHONY: bin
bin:
	for file in $(shell find $(CURDIR)/bin -type f -not -name "*-backlight" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".config" -not -name ".*.swp" -not -name ".editorconfig" -not -name "bin" -not -name "fonts"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

	git update-index --skip-worktree $(CURDIR)/.gitconfig;

	mkdir -p $(HOME)/.config;
  for file in $(shell find $(CURDIR)/.config -name ".*"); do \
    f=$$(basename $$file); \
		ln -sfn $(CURDIR)/config/$$file $(HOME)/.config/$$f; \
  done;

	mkdir -p $(HOME)/.local/share;
	ln -snf $(CURDIR)/.fonts $(HOME)/.local/share/fonts;
