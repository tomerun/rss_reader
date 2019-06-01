-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE feeds (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	url TEXT NOT NULL UNIQUE,
	link TEXT NOT NULL,
	description TEXT,
	date TEXT,
	feed_type INTEGER NOT NULL,
	created_at TEXT,
	updated_at TEXT
);
CREATE INDEX feeds_link ON feeds(link);
CREATE TABLE entries (
	id INTEGER PRIMARY KEY,
	feed_id INTEGER REFERENCES feeds,
	title TEXT NOT NULL,
	link TEXT NOT NULL UNIQUE,
	summary TEXT,
	content TEXT,
	seen INTEGER NOT NULL DEFAULT 0,
	clicked INTEGER NOT NULL DEFAULT 0,
	date TEXT,
	created_at TEXT,
	updated_at TEXT
);
CREATE INDEX entries_feed ON entries(feed_id);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE entries;
DROP INDEX feeds_link;
DROP TABLE feeds;
