docker-test:
	docker-compose run --rm app make test-mysql
	docker-compose run --rm app make test-postgresql
	docker-compose run --rm app make test-mssql

test-mysql:
	GORM_DIALECT=mysql GORM_DSN="gorm:gorm@tcp(mysql:3306)/gorm?charset=utf8&parseTime=True" go test -race ./...

test-postgresql:
	GORM_DIALECT=postgres GORM_DSN="host=postgres user=gorm password=gorm DB.name=gorm port=5432 sslmode=disable" go test -race ./...

test-mssql:
	GORM_DIALECT=mssql GORM_DSN="sqlserver://gorm:LoremIpsum86@mssql:1433?database=gorm" go test -race ./...