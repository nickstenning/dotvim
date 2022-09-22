VIM_PROG := $(shell which nvim >/dev/null 2>&1 && echo nvim || echo vim)

.PHONY: default
default:
	@echo 'using $(VIM_PROG) as vim'
	@ln -sfn 'src/dotvim' ~/.vim
	@ln -sfn '.vim/_vimrc' ~/.vimrc
	@ln -sfn '.vim/_gvimrc' ~/.gvimrc
	@install -d ~/.config/nvim
	@ln -sfn '../../.vim/init.vim' ~/.config/nvim/init.vim
	@test ! -t 1 && echo skipping plugin install for unattended session >&2 || :
	@test -t 1 && $(VIM_PROG) +PluginInstall +qall || :
