.PHONY: help runner image reset

help:
   @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'



deploy:
   flutter clean && flutter pub get && flutter build web && cp -R ~/IdeaProjects/jordyhers/build/web /Users/jordyhers/IdeaProjects/jordyhers/public && git add . && git commit -m "deploy" && git push origin master


