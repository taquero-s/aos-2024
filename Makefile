1:
	cat ./data/advent_of_sql_day_1.sql ./sql/day_1.sql > query.sql

2:
	cat ./data/advent_of_sql_day_2.sql ./sql/day_2.sql > query.sql

7:
	cat ./data/advent_of_sql_day_7.sql ./sql/day_7.sql > query.sql

8:
	cat ./data/advent_of_sql_day_8.sql ./sql/day_8.sql > query.sql

run:
	@touch query.sql
	@cat query.sql | poetry run duckdb
	@rm query.sql

csv:
	@touch query.sql
	@cat query.sql | poetry run duckdb --cmd '.mode csv'
	@rm query.sql
