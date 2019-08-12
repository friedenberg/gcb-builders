#! /bin/sh -e

brew bundle exec -- hadolint docker/*
brew bundle exec -- shellcheck scripts/*
