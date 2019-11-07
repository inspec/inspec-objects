#!/bin/sh

############################################################################
# What is this script?
#
# Chef uses a workflow tool called Expeditor to manage version bumps, changelogs
# and releases. After a PR is merged in Chef Expeditor calls this script to update
# the PATCH version in the VERSION file as well as the version.rb file.
############################################################################

set -evx

sed -i -r "s/^(\s*)VERSION = \".+\"/\1VERSION = \"$(cat VERSION)\"/" lib/inspec-objects/version.rb

# Once Expeditor finishes executing this script, it will commit the changes and push
# the commit as a new tag corresponding to the value in the VERSION file.
