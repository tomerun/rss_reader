-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE feeds (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	url TEXT NOT NULL,
	link TEXT NOT NULL,
	description TEXT,
	updated_at TEXT
);
CREATE TABLE entries (
	id INTEGER PRIMARY KEY,
	feed_id INTEGER REFERENCES feeds,
	title TEXT NOT NULL,
	link TEXT NOT NULL,
	summary TEXT,
	content TEXT,
	date TEXT,
	seen INTEGER NOT NULL DEFAULT 0,
	clicked INTEGER NOT NULL DEFAULT 0
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE entries;
DROP TABLE feeds;
