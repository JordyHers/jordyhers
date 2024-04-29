.PHONY: release doctor

release:
	flutter clean && flutter pub get && flutter build web && cd /Users/jordyigondjo/StudioProjects/jordyhers && rm -R public && cp -R ~/StudioProjects/jordyhers/build/web /Users/jordyigondjo/StudioProjects/jordyhers/public && git add . && git commit -m "deploy" && git push origin master

doctor:
	flutter doctor

