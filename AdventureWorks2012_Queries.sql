select * from person.person
select * from person.emailaddress
select * from person.personphone
select * from person.Phonenumbertype

a. Get all the details from the person table including email ID, phone 
number and phone number type   

SELECT 
   P.BusinessEntityID,
   P.FirstName,
   P.MiddleName,
   P.LastName,
   E.EmailAddress,
   PH.PhoneNumber,
   PT.Name AS PhoneNumberType
FROM Person.Person AS P
LEFT JOIN Person.EmailAddress AS E
     ON P.BusinessEntityID = E.BusinessEntityID
LEFT JOIN Person.PersonPhone AS PH
     ON P.BusinessEntityID = PH.BusinessEntityID
LEFT JOIN Person.PHoneNumberType AS PT
     ON PH.PhoneNumberTypeID = PT.PhoneNumberTypeID;


b. Get the details of the sales header order made in May 2011   

SELECT * 
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-05-01'
  AND OrderDate < '2011-06-01';

c. Get the details of the sales details order made in the month of May 
2011 

select 
      D.*,
      H.OrderDate
from Sales.SalesOrderDetail AS D
INNER JOIN Sales.SalesOrderHeader AS H
      ON D.SalesOrderID = H.SalesOrderID
where OrderDate >= '2011-05-01'
  and OrderDate < '2011-06-01' 

d. Get the total sales made in May 2011   

select
    sum(TotalDue) AS TotalSales 
FROM Sales.SalesOrderHeader
where OrderDate >= '2011-05-01'
  and OrderDate < '2011-06-01'


e. Get the total sales made in the year 2011 by month order by 
increasing sales   

select 
   month(OrderDate) AS SalesMonth,
   sum(TotalDue) AS TotalSales
from Sales.SalesOrderHeader
where OrderDate >= '2011-01-01'
  and OrderDate < '2012-01-01'
group by MONTH (OrderDate)
order by TotalSales ASC




f. Get the total sales made to the customer with FirstName='Gustavo' 
and LastName ='Achong' 

select 
     P.FirstName,
     P.LastName,
     SUM(SOH.TotalDue) AS TotalSales
FROM Sales.Customer AS C
Inner Join Person.Person AS P
    ON C.PersonID = P.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader AS SOH
    ON C.CustomerID = SOH.CustomerID
WHERE P.FirstName = 'Gustavo'
  AND P.LastName = 'Achong'
GROUP BY
    P.FirstName,
    P.LastName;


