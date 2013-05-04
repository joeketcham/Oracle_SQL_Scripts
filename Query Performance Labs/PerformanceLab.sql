SET TIMING ON
SET AUTOTRACE ON

SELECT su.CompanyName, CategoryName, ProductName, c.CompanyName, c.country, FirstName, LastName, Quantity, d.UnitPrice, sh.CompanyName
FROM OrderDetails d, Suppliers su, Shippers sh, Categories t, Products p, Employees e, Customers c, orders o
WHERE t.CategoryID=p.CategoryID AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID AND o.OrderID=d.OrderID AND p.ProductID=d.ProductID AND sh.ShipperID=o.ShipVia AND su.SupplierID=p.SupplierID AND LOWER(ProductName) Like '%lager%' AND LOWER(c.city) IN ('vancouver', 'london','charleroi','cunewalde') AND d.Quantity
BETWEEN 5 AND 100 AND RequiredDate - ShippedDate > 10
ORDER BY c.CompanyName;

SELECT /*+ ORDERED */
su.CompanyName, CategoryName, ProductName, c.CompanyName, c.country, FirstName, LastName, Quantity, d.UnitPrice, sh.CompanyName
FROM OrderDetails d, Suppliers su, Shippers sh, Categories t, Products p, Employees e, Customers c, orders o
WHERE t.CategoryID=p.CategoryID AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID AND o.OrderID=d.OrderID AND p.ProductID=d.ProductID AND sh.ShipperID=o.ShipVia AND su.SupplierID=p.SupplierID AND LOWER(ProductName) Like '%lager%' AND LOWER(c.city) IN ('vancouver', 'london','charleroi','cunewalde') AND d.Quantity
BETWEEN 5 AND 100 AND (RequiredDate - ShippedDate > 10)
ORDER BY c.CompanyName;

SELECT /*+ ORDERED */
su.CompanyName, CategoryName, ProductName, c.CompanyName, c.country, FirstName, LastName, Quantity, d.UnitPrice, sh.CompanyName
FROM OrderDetails d, Orders o, Customers c, Products p, Suppliers su, Employees e, Categories t, Shippers sh
WHERE t.CategoryID=p.CategoryID AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID AND o.OrderID=d.OrderID AND p.ProductID=d.ProductID AND sh.ShipperID=o.ShipVia AND su.SupplierID=p.SupplierID AND LOWER(ProductName) Like '%lager%' AND LOWER(c.city) IN ('vancouver', 'london','charleroi','cunewalde') AND d.Quantity
BETWEEN 5 AND 100 AND (RequiredDate - ShippedDate > 10)
ORDER BY c.CompanyName;

SELECT /*+ ORDERED */
su.CompanyName, CategoryName, ProductName, c.CompanyName, c.country, FirstName, LastName, Quantity, d.UnitPrice, sh.CompanyName
FROM Shippers sh, Categories t, Employees e, Suppliers su, Products p, Customers c, Orders o, OrderDetails d
WHERE t.CategoryID=p.CategoryID AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID AND o.OrderID=d.OrderID AND p.ProductID=d.ProductID AND sh.ShipperID=o.ShipVia AND su.SupplierID=p.SupplierID AND LOWER(ProductName) Like '%lager%' AND LOWER(c.city) IN ('vancouver', 'london','charleroi','cunewalde') AND d.Quantity
BETWEEN 5 AND 100 AND (RequiredDate - ShippedDate > 10)
ORDER BY c.CompanyName;

SELECT /*+ ORDERED */
su.CompanyName, CategoryName, ProductName, c.CompanyName, c.country, FirstName, LastName, Quantity, d.UnitPrice, sh.CompanyName
FROM Shippers sh, Categories t, Employees e, Suppliers su, Products p, Customers c, OrderDetails d, Orders o
WHERE t.CategoryID=p.CategoryID AND c.CustomerID=o.CustomerID AND e.EmployeeID=o.EmployeeID AND o.OrderID=d.OrderID AND p.ProductID=d.ProductID AND sh.ShipperID=o.ShipVia AND su.SupplierID=p.SupplierID AND LOWER(ProductName) Like '%lager%' AND LOWER(c.city) IN ('vancouver', 'london','charleroi','cunewalde') AND d.Quantity
BETWEEN 5 AND 100 AND (RequiredDate - ShippedDate > 10)
ORDER BY c.CompanyName;
