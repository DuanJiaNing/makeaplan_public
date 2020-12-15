module makeaplan.com

go 1.13

require (
	github.com/go-sql-driver/mysql v1.5.0
	github.com/golang/protobuf v1.4.2
	github.com/guregu/null v4.0.0+incompatible
	github.com/jinzhu/gorm v1.9.16
	google.golang.org/grpc v1.32.0
	google.golang.org/protobuf v1.25.0
	makeaplan.com/api v0.0.0-00010101000000-000000000000
)

replace makeaplan.com/api => ./pb/makeaplan.com/api
