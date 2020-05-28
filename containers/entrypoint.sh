#!/bin/sh

CONFIG_RU=/app/config.ru bundle exec rackup -E production -p 80 -s thin