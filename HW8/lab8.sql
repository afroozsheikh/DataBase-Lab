--====================== Q1 ======================
----- first transaction
BEGIN TRAN

SELECT ModifiedDate
FROM Production.Product
where ProductID = 317

waitfor delay '00:00:010'

COMMIT;

SELECT ModifiedDate
FROM Production.Product
where ProductID = 317

-----second transaction
BEGIN TRAN

UPDATE Production.Product
SET ModifiedDate = GETDATE()
WHERE ProductID = 317

COMMIT;

--========================= Q2 ====================
----------- Q2 Dirty Read ---------
-- First Transaction

BEGIN TRAN
UPDATE Sales.SalesOrderDetail
SET ModifiedDate = GETDATE()
WHERE SalesOrderID = 43660 and SalesOrderDetailID = 14

waitfor delay '00:00:20'
Rollback Transaction

-- Second Transaction

set transaction isolation level read uncommitted

SELECT * FROM Sales.SalesOrderDetail
where SalesOrderID = 43660 and SalesOrderDetailID = 14

------------------------------------
---------- Q2 Non Repeatable Read ---------

-----First Transaction

BEGIN TRAN
SELECT ModifiedDate
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 43661 and SalesOrderDetailID = 22

waitfor delay '00:00:10'

SELECT ModifiedDate
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 43661 and SalesOrderDetailID = 22

COMMIT;

----- Second Transaction

BEGIN TRAN
waitfor delay '00:00:2'

UPDATE Sales.SalesOrderDetail
SET ModifiedDate = GETDATE()
WHERE  SalesOrderID = 43661 and SalesOrderDetailID = 22

COMMIT;



