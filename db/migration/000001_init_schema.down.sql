DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS transfers;

-- It's important that we delete at the end "account" table because
-- the others are vinculated with it
DROP TABLE IF EXISTS account;