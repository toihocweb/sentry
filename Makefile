SENTRY_AUTH_TOKEN=47111e1e8d5b42dca183f9d864c2da842a89a1bb19314df18feafb2c63620bfe
SENTRY_ORG=toihocweb
SENTRY_PROJECT=react

REACT_APP_RELEASE_VERSION=`sentry-cli releases propose-version`


setup_release: create_release upload_sourcemaps associate_commits

create_release: 
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(REACT_APP_RELEASE_VERSION)
upload_sourcemaps: 
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) files $(REACT_APP_RELEASE_VERSION)\
		upload-sourcemaps --url-prefix "~/static/js" --validate build/static/js --rewrite
associate_commits:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) set-commits --auto $(REACT_APP_RELEASE_VERSION)
