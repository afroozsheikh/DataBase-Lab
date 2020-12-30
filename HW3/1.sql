
--------1
create login login_test
with password='123'


--------2
create server role Role1
alter server role dbcreator
add member Role1

--------3
alter server role Role1
add member login_test

--------4
use AdventureWorks2012
go
create user user_test for login login_test

alter role db_owner 
add member user_test



create table table_1(
firstname varchar(20)
)

insert into table_1 values('aaaa')

select * from table_1

