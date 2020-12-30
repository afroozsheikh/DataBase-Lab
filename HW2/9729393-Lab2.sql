---- Afrooz Sheikholeslami



------------------------------------------------------------------
---- Q1

SELECT s1.SalesOrderID, s1.OrderDate, s1.Status, s1.CustomerID, s1.TerritoryID, s1.SubTotal
FROM Sales.SalesOrderHeader s1 INNER JOIN Sales.SalesTerritory s2
	ON s1.TerritoryID = s2.TerritoryID
WHERE s1.SubTotal > 100000 and s1.SubTotal < 500000 and s1.Status = 5
and s2.CountryRegionCode in ('FR', 'US', 'CA');


-------------------------------------------------------------------
---- Q2

SELECT s1.SalesOrderID, s1.CustomerID,s1.SubTotal, s1.OrderDate, s3.Name
FROM Sales.SalesOrderHeader s1 INNER JOIN Sales.Customer s2
	ON s1.CustomerID = s2.CustomerID INNER JOIN Sales.Store s3
	ON s2.StoreID = s3.BusinessEntityID

-------------------------------------------------------------------
---- Q3

WITH table_1 AS
(
	SELECT s1.ProductID as pro_id, s3.Name as teri_name, count(s1.SalesOrderID) as count_orders
	FROM Sales.SalesOrderDetail s1 INNER JOIN Sales.SalesOrderHeader s2
		ON s1.SalesOrderID = s2.SalesOrderID INNER JOIN  Sales.SalesTerritory s3
		ON s2.TerritoryID = s3.TerritoryID
	GROUP BY s1.ProductID, s3.Name
)

SELECT pro_id, teri_name
FROM table_1 as t
WHERE t.count_orders = (
	select max(count_orders)
	from table_1 as s
	where s.pro_id = t.pro_id
)

-------------------------------------------------------------------
---- Q4

SELECT s1.SalesOrderID, s1.OrderDate, s1.Status, s1.CustomerID,
s1.TerritoryID, s1.SubTotal, s1.TotalDue
INTO NAmerica_Sales
FROM Sales.SalesOrderHeader s1 INNER JOIN Sales.SalesTerritory s2
	ON s1.TerritoryID = s2.TerritoryID
WHERE (s1.SubTotal > 100000 and s1.SubTotal < 500000 and s1.Status = 5
and (s2.CountryRegionCode in ('US', 'CA')))


ALTER TABLE NAmerica_Sales
ADD price_rate char(4) CHECK (price_rate in ('High', 'Low', 'Mid'))


UPDATE NAmerica_Sales
SET price_rate =
(CASE 
WHEN SubTotal > (select avg(SubTotal) from NAmerica_Sales) THEN 'High'
WHEN SubTotal = (select avg(SubTotal) from NAmerica_Sales) THEN 'Mid'
WHEN SubTotal < (select avg(SubTotal) from NAmerica_Sales) THEN 'Low'
END)

-------------------------------------------------------------------
---- Q5

WITH table_3 AS(
SELECT BusinessEntityID ,max(Rate) as max_rate
FROM HumanResources.EmployeePayHistory
GROUP BY BusinessEntityID
),
table_a AS(SELECT BusinessEntityID, max_rate
FROM table_3
WHERE max_rate > (select avg(max_rate) from table_3)
),

table_b AS(SELECT BusinessEntityID, max_rate
FROM table_3
WHERE max_rate < (select avg(max_rate) from table_3)
)SELECT BusinessEntityID,CASE	WHEN max_rate > (select AVG(max_rate) from table_a)		THEN max_rate * 1.05	WHEN max_rate < (select AVG(max_rate) from table_a)		THEN max_rate * 1.1END AS NewSalary, (CASE	WHEN max_rate < 29 THEN 3	WHEN max_rate > 29 and max_rate < 50 THEN 2	ELSE 1END) AS LevelFROM table_aUNION
SELECT BusinessEntityID,CASE	WHEN max_rate > (select AVG(max_rate) from table_a)		THEN max_rate * 1.15	WHEN max_rate < (select AVG(max_rate) from table_a)		THEN max_rate * 1.2END AS NewSalary,(CASE	WHEN max_rate < 29 THEN 3	WHEN max_rate > 29 and max_rate < 50 THEN 2	ELSE 1END) AS LevelFROM table_b



