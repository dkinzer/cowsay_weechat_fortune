.PHONY: default test minitest deploy

default: test

test: minitest

minitest:
	ruby tests/*.rb

deploy:
	mkdir -p  ~/.weechat/ruby/autoload
	cp -f src/cowsay_weechat_fortune.rb ~/.weechat/ruby/autoload
