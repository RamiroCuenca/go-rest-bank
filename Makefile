# Create the container with docker using the postgres image
postgres:
	docker run --name postgres1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

# This rule creates the db
createdb:
	docker exec -it postgres1 createdb --username=root --owner=root bank_app

# This rule deletes the db
dropdb:
	docker exec -it postgres1 dropdb bank_app

# This rule runs the migrations up
run-migrations-up:
	migrate --path db/migration --database "postgresql://root:secret@localhost:5432/bank_app?sslmode=disable" --verbose up

# .PHONY tell explicitly to MAKE that those rules are not associated with files
.PHONY: postgres createdb dropb run-migrations-up