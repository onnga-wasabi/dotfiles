DOTPATH := `git rev-parse --show-toplevel`

update:
	-git add . && git commit -m "update"
	-git pull origin main && git push origin main

git-pull-origin: .
	git pull origin main

run: git-pull-origin
	@bash $(DOTPATH)/bin/init.sh
