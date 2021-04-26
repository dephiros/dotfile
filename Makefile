SHELL := /usr/bin/env bash
DIR := ${HOME}/dotfiles
DOTS = ${DIR}/dots
DOT_OLD := ${HOME}/dotfiles_old
CONFIG := ${DIR}/config
CONFIG_OLD := ${HOME}/config_old
DOT_SOURCES := $(notdir $(wildcard ${DOTS}/*))
DOT_FILES := $(addprefix .,${DOT_SOURCES})
DOT_FILE_PATHS := $(addprefix ${HOME}/,${DOT_FILES})
DOT_OLD_PATHS := $(addprefix ${DOT_OLD}/,${DOT_FILES})
CONFIG_SOURCES := $(notdir $(wildcard ${CONFIG}/*))
CONFIG_FILES := ${CONFIG_SOURCES}
CONFIG_FILE_PATHS := $(addprefix ${HOME}/.config/,${CONFIG_FILES})
CONFIG_OLD_PATHS := $(addprefix ${CONFIG_OLD}/,${CONFIG_FILES})

all: ${DOT_FILE_PATHS} ${CONFIG_FILE_PATHS} install.log ${HOME}/.emacs.d ${HOME}/liquidprompt ${HOME}/.tmux ${HOME}/ssh-find-agent

install.log: Brewfile install.bash
	# |& redirect both standard and error and still visible in the terminal: https://askubuntu.com/a/731237
	./install.bash |& tee install.log

${HOME}/liquidprompt:
	@echo - set up liquidprompt
	rm -rf ~/liquidprompt \
	git clone git://github.com/nojhan/liquidprompt.git ~/liquidprompt

${HOME}/.tmux:
	@echo - set up tmux
	git clone git://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	@echo "\n"

${HOME}/ssh-find-agent:
	echo 'Pulling ssh-find-agent'
	rm -rf ${HOME}/ssh-find-agent \
	git clone git://github.com/wwalker/ssh-find-agent.git "$HOME/ssh-find-agent" \
	echo "\n"

${DOT_OLD}:
	mkdir -p ${DOT_OLD}

.SECONDARY: ${DOT_OLD_PATHS}
${DOT_OLD}/.%: ${DOT_OLD} ${DOTS}/%
	@echo \#\# backing up .$*
	-mv ${HOME}/.$* ${DOT_OLD}/

${HOME}/.%: ${DOTS}/% ${DOT_OLD_PATHS}
	@echo \#\# linking dotfiles .$*
	ln -fs ${DOTS}/$* ${HOME}/.$*
	@echo done linking dotfiles

${CONFIG_OLD}:
	mkdir -p ${CONFIG_OLD}

.SECONDARY: ${CONFIG_OLD_PATHS}
${CONFIG_OLD}/%: ${CONFIG_OLD} ${CONFIG}/%
	@echo \#\# backing up config for $*
	-mv ${HOME}/.config/$* ${CONFIG_OLD}/

${HOME}/.config/%: ${CONFIG}/% ${CONFIG_OLD_PATHS}
	@echo \#\# linking config $*
	ln -fs ${CONFIG}/$* ${HOME}/.config/$*
	@echo done linking config

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
