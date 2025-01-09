/* User */
select * from Users order by UserID

insert into Users(UserName, FullName, [Password], RoleID, [Image], [Email], BirthDay, [Address], Phone, [status]) values
('Me','MeMe','123',2,'','memehaha@gmail.com','1999-01-10',N'Hải Phòng','09872112312',1);

delete from Users where UserID = 9

update Users set FullName  = N'Nguyễn Phương Thảo' where UserID = 1

select CategoryID, CategoryName, [Description] from Categories
select CategoryID, CategoryName, [Description] from Categories where CategoryID = 1
select SupplierID, CompanyName, ContactName, Country, Phone, HomePage from Suppliers
select SupplierID, CompanyName, ContactName, Country, Phone, HomePage from Suppliers where SupplierID = 1
select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products

select top 5 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
where [status] = 1
order by QuantitySold desc

select top 5 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
order by releaseDate desc

select top 4 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
where CategoryID = '5'

select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
where ProductName like '%son%'

select UserName, FullName, [Password], RoleID, [Image], [Email], BirthDay, [Address], Phone, [status] from Users
where UserName like '%u%'

update Users set RoleID = 1 where UserName = 'Me'

declare @page int = 2, @size int = 2


select * from Products
order by ProductID
OFFSET ((@page - 1) * @size) ROWS
FETCH NEXT @size ROWS ONLY

select count(*) from Products


select count(ProductID) from Products where ProductName like '%kem%'


declare @page int = 1, @size int = 8

select * from Products
where ProductName like '%kem%'
order by ProductID
OFFSET ((@page - 1) * @size) ROWS
FETCH NEXT @size ROWS ONLY

select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
where ProductName like '%kem%' 
order by ProductID
OFFSET ((@page - 1) * 8) ROWS
FETCH NEXT 8 ROWS ONLY

select*from Products where CategoryID=1
select count(ProductID) from Products where CategoryID=1 and [status] = 1

select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
where CategoryID = 1
order by ProductID
OFFSET ((@page - 1) * 8) ROWS
FETCH NEXT 8 ROWS ONLY

select*from Products where CategoryID=5 and ProductName like '%4%'
select count(ProductID) from Products where CategoryID = 5 and ProductName like '%4%'

select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products
where CategoryID = 2 and ProductName like '%th%'
order by ProductID
OFFSET ((@page - 1) * 8) ROWS
FETCH NEXT 8 ROWS ONLY

select * from  Products where ProductID=1
update Products set QuantitySold = QuantitySold + 1 where ProductID=1
select * from  Products where ProductID=1
update Products set UnitsInStock = UnitsInStock - 1  where ProductID=1
select * from  Products where ProductID=1

insert into Orders(Date, UserName, TotalMoney, [status]) values
(?, ?, ?, ?);

insert into OrderDetails(OrderID, ProductID, Quantity, UnitPrice) values
(?, ?, ?, ?);

select * from Users 

update Products set
ProductName = ?, 
UnitPrice = ?, 
SupplierID = ?,
CategoryID = ?, 
UnitsInStock = ?, 
[image] = ?,
describe = ? 
where ProductID = ?

update Products set [status] = 0 where ProductID = ?


select * from Suppliers
select * from  Products
select * from Categories
select * from Orders
select * from OrderDetails
update Products set releaseDate= '2024-10-15' where ProductID = 5;
truncate table Products
drop table Cart


select * from Orders 
select * from OrderDetails where OrderID = 2


select count(*) from Cart where UserName = 'User1'

insert into Cart([UserName], ProductID, quantity) values('User1', 5, 1);

DELETE FROM Cart WHERE UserName = 'user1'
SELECT * FROM Cart WHERE ProductID = 1 AND UserName = 'Pthao'