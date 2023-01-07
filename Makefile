.PHONY: test

test:
	act "pull_request" -s GITHUB_TOKEN
