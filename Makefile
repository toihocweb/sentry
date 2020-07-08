SENTRY_AUTH_TOKEN=17476021c2f34358842c2604d30529be8fd8c2ad39604c628d78adce4532a834
SENTRY_ORG=toihocweb
SENTRY_PROJECT=toihocweb

REACT_APP_RELEASE_VERSION=`sentry-cli releases propose-version`


setup_release: create_release upload_sourcemaps associate_commits

create_release: 
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(REACT_APP_RELEASE_VERSION)

upload_sourcemaps: 
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) files $(REACT_APP_RELEASE_VERSION) \
		upload-sourcemaps --url-prefix "~/static/js" --validate build/static/js --rewrite
associate_commits:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) set-commits --auto $(REACT_APP_RELEASE_VERSION)
