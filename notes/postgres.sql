/*
 * postgres.sql snippets in the context of Kpler (mostly)
 */

-- order by with a few tricks
SELECT name, mmsi
  FROM vessel
  ORDER BY mmsi DESC NULLS LAST
  LIMIT 10;

-- count stuff
SELECT COUNT(*) FROM vessel
  WHERE mmsi IS NOT NULL;
  -- WHERE mmsi NOTNULL;
