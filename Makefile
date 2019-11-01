DOTPATH := ${HOME}/dotfiles

all:

list:
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

deploy:
	@echo "crating symlinks"
	${DOTPATH}/bin/createsymlinks.sh

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

clean:
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)
