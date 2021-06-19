#!/usr/bin/env bash
grep -Rl --exclude-dir=_site "$@"
