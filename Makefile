.PHONY: default
default:
	@ln -sfn 'src/dotvim' ~/.vim
	@ln -sfn '.vim/_vimrc' ~/.vimrc
	@ln -sfn '.vim/_gvimrc' ~/.gvimrc
	@test ! -t 1 && echo skipping plugin install for unattended session >&2 || :
	@test -t 1 && vim +PluginInstall +qall || :
