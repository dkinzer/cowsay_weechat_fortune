.PHONY: default test minitest deploy

default: test

test: minitest

minitest:
	ruby tests/*.rb

deploy:
	cp -f lib/cowsay_weechat_fortune.rb ~/.weechat/ruby/autoload
