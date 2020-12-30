use AdventureWorks2012
go

create user user_test for login login_test

create role Role2

alter role db_securityadmin
add member Role2

alter role Role2 
add member user_test

grant select
on database::Adventureworks2012
to Role2