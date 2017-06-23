/*
 * postgres.sql snippets
 */

-- order by with a few tricks
SELECT name, mmsi
  FROM vessel
  ORDER BY mmsi DESC NULLS LAST
  LIMIT 10;

-- count stuff
SELECT COUNT(*) FROM {}
  WHERE mmsi IS NOT NULL;
  -- WHERE mmsi NOTNULL;

-- list possible values of a column
SELECT DISTINCT <column> FROM <table>


-- kill idle connections
\d pg_stat_activity  -- alias for `describe``
SELECT pg_terminate_backend(111111)  -- kill pid 1111111
