#!/usr/bin/env bash

db.init:
	rm database.db
	cat db.sql | sqlite3 database.db
	cat data.sql | sqlite3 database.db
