nums = 1 2 7 8 14
num = $(1)
$(nums):
	@echo "Building query $@"
	@cat ./data/advent_of_sql_day_$@.sql ./sql/day_$@.sql > query.sql

run:
	@touch query.sql
	@cat query.sql | poetry run duckdb
	@rm query.sql

csv:
	@touch query.sql
	@cat query.sql | poetry run duckdb --cmd '.mode csv'
	@rm query.sql
