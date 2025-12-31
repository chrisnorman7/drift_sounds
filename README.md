# Drift Sounds

## Description

This package allows you to keep your sound files reasonably hidden in an SQLite
database backed by [drift](https://drift.simonbinder.eu/), to keep them from
casual prying eyes.

The database will not be encrypted (unless there is a feature request), and sounds can be viewed by anyone with an sqlite client. That said, the only data which are stored will be a numeric ID and the
raw data of the file, so no filenames will be exposed outside of code.

This package relies on the [drift_sounds_database](https://pub.dev/packages/drift_sounds_database) package, which provides the database.
