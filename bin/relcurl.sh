#!/usr/bin/env bash

set -eu
curl -vLJO -H "Authorization: token ${GITHUB_TOKEN}"
