/*
 * users.sql
 * Copyright (C) 2016 hackliff <xavier.bruhiere@gmail.com>
 *
 * Distributed under terms of the MIT license.
 */

-- vim:et

CREATE DATABASE analytics;

USE analytics

CREATE TABLE users (id INT PRIMARY KEY, name TEXT, downloads INT, clicks INT, ltv REAL);

INSERT INTO users VALUES(1, "xav", 2, 45, 55);
INSERT INTO users VALUES(2, "bri", 1, 30, 155);
