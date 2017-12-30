GITREPO_DOTFILES = https://github.com/ok-yamachaaan/dotfiles.git
DIR_DEV_BASE = $(HOME)/dev
DIR_GIT_REPO = $(DIR_DEV_BASE)/gitrepo
DIR_DOTFILES = $(DIR_GIT_REPO)/dotfiles
DIR_WORKSPACE = $(DIR_DEV_BASE)/workspace

all: setup
	@ansible-playbook ./localhost.yml -vvvv --ask-become-pass

setup:
	export DIR_GIT_REPO = $(DIR_GIT_REPO)
	export DIR_DOTFILES = $(DIR_DOTFILES)
	export DIR_WORKSPACE = $(DIR_WORKSPACE)
	[ -d $(DIR_GIT_REPO) ] || mkdir -p $(DIR_GIT_REPO)
	[ -d $(DIR_WORKSPACE) ] || mkdir -p $(DIR_WORKSPACE)
	@git clone $(GITREPO_DOTFILES) $(DIR_DOTFILES)
	@sh -c "./bin/setup.sh"

.PHONY: all, setup
