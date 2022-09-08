DOTPATH := `git rev-parse --show-toplevel`

.PHONY: etc/brew/Brewfile
etc/brew/Brewfile:
	cd etc/brew; brew bundle dump -f

update: etc/brew/Brewfile
	-git add . && git commit -m "update" && git push origin main

git-pull-origin: .
	git pull origin main

run: git-pull-origin
	@bash $(DOTPATH)/bin/init.sh
