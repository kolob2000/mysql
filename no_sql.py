# 1.

SADD ip '192.168.0.1' '192.168.0.2'

SMEMBERS ip

SCARD ip

# 2.

set Nickolay k.kolabis@mail.ru
set k.kolabis@mail.ru Nickolay

get Nickolay
get k.kolabis@mail.ru

# 3.

# таблица catalogs
use catalogs
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])


#таблица productd
use products
db.products.insert({"name": "Intel Core i7-9900", "description": "Процессор для ПК", "price": "11000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()})

db.products.insertMany([
	{"name": "AMD FX-9590", "description": "Процессор для ПК", "price": "9000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "Intel Core i3-1005g1", "description": "Процессор для ПК", "price": "10000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}])

db.products.find({name: "Intel Core i3-1005g1"}).pretty()





