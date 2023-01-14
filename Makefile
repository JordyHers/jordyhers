.PHONY: release doctor

release:
	flutter clean && flutter pub get && flutter build web && cp -R ~/IdeaProjects/jordyhers/build/web /Users/jordyhers/IdeaProjects/jordyhers/public && git add . && git commit -m "deploy" && git push origin master

doctor:
	flutter doctor

