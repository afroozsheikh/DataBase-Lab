------------------------------------------------------------------------------
--------------------Q2
select 
--GROUPING(s1.Name), GROUPING(s1.[Group]),
case grouping(s1.Name)
when 0 then s1.Name
when 1 then 'All Territories'
end as TerritoryName,

case grouping(s1.[Group])
when 0 then s1.[Group]
when 1 then 'All Regions'
end as TerritoryName,

sum(s2.SubTotal), count(s2.SalesOrderID) 
from Sales.SalesTerritory s1 inner join Sales.SalesOrderHeader s2
	on s1.TerritoryID = s2.TerritoryID
group by GROUPING sets((), s1.[Group], (s1.Name, s1.[Group])) 

--group by cube(s1.Name, s1.[Group])
order by s1.[Group]

-------------------------------------------------------------------------------
-------------------Q3
select 
case GROUPING(s3.name)
when 0 then s3.name
when 1 then 'All Subcategories'
end as SubName,
case GROUPING(s4.name)
when 0 then s4.name
when 1 then 'All Categories'
end as CategoryName,
	sum(s2.OrderQty) as count_orders, sum(s2.UnitPrice * s2.OrderQty) as sum_prices

from Production.Product s1 inner join Sales.SalesOrderDetail s2
	on s1.ProductID = s2.ProductID inner join Production.ProductSubcategory s3 
	on s3.ProductSubcategoryID = s1.ProductSubcategoryID inner join Production.ProductCategory s4
	on s3.ProductCategoryID = s4.ProductCategoryID
group by GROUPING sets((), s4.Name, (s3.Name, s4.Name))
