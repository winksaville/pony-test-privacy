ponyc=ponyc
flags=--pic
app=test-privacy
app_src=main.pony
deps=pkgs/actor.pony pkgs/private_actor.pony

$(app): $(app_src) $(deps)
	$(ponyc) $(flags) --bin-name=$(app) .

.PHONY: clean
clean:
	rm $(app)
