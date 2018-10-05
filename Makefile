.PHONY: default
default:
	@ln -sfn 'src/dotvim' ~/.vim
	@ln -sfn '.vim/_vimrc' ~/.vimrc
	@ln -sfn '.vim/_gvimrc' ~/.gvimrc
	@vim +PluginInstall +qall
