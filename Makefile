.PHONY: default test test-report deploy

default: test

test:
	ruby -e 'ARGV.each {|file| require file}' ./tests/*.rb

test-report:
	CODECLIMATE_REPO_TOKEN=ea9f143077246776b08ea6cb17e7a1480f20c10bc05701c2d5ffa87cec888aa6 \
	  ruby -e 'require "codeclimate-test-reporter"; CodeClimate::TestReporter.start; ARGV.each {|file| require file}' ./tests/*.rb

deploy:
	mkdir -p  ~/.weechat/ruby/autoload
	cp -f src/cowsay_weechat_fortune.rb ~/.weechat/ruby/autoload
