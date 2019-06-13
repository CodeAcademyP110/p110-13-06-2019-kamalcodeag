
--PROCEDURE

--alter procedure SP_OrderSummary 
--	@category nvarchar(100) = null, 
--	@product nvarchar(100) = null,
--	@quantity int = null
--as
--select 
--	Products.Name,
--	Categories.Name 'Category',
--	ord.Quantity,
--	ord.Price 'Purchased Price',
--	Products.Price 'Actual Price',
--	CONCAT(Customers.Firstname, ' ', Customers.Lastname) Fullname
--from OrderDetails ord
--join Orders on ord.OrderId = Orders.Id
--join Customers on Orders.CustomerId = Customers.Id
--join Products on ord.ProductId = Products.Id
--join Categories on Products.CategoryId = Categories.Id
--where 
--	Categories.Name LIKE '%' + isnull(@category, Categories.Name) + '%' 
--	AND 
--	Products.Name LIKE '%' + isnull(@product, Products.Name) + '%'
--	AND
--	ord.Quantity >= isnull(@quantity, ord.Quantity)

-- drop procedure SP_OrderSummary



-- FUNCTION

--alter function get_email_domain (@email nvarchar(100))
--returns nvarchar(50)
--as
--begin
--	return substring(@email, charindex('@', @email, 0) + 1, 100)
--end


--CASE

--select 
--	Id,
--	Firstname,
--	Lastname,
--	case Gender
--		when 1 then 'Male'
--		when 0 then 'Female'
--		else 'Other'
--	end
--	Email,
--	dbo.get_email_domain(Email) 'Email domain'
--from Customers




-- PROCEDURE WITH RETURN TYPE
--create procedure SP_GetTotalRevenue 
--	@category nvarchar(100) = null,
--	@total decimal(18, 2) out
--as
--select 
--	@total = sum(ord.Quantity * ord.Price)
--from OrderDetails ord
--join Orders on ord.OrderId = Orders.Id
--join Customers on Orders.CustomerId = Customers.Id
--join Products on ord.ProductId = Products.Id
--join Categories on Products.CategoryId = Categories.Id
--where 
--	Categories.Name LIKE '%' + isnull(@category, Categories.Name) + '%' 


--declare @sum decimal(18,2)
--exec SP_GetTotalRevenue @category = 'Cookies', @total = @sum out

--select @sum as 'Sum of Cookies'


--TRIGGER
--create table Employees (
--	Id int primary key identity,
--	Firstname nvarchar(50) not null,
--	Lastname nvarchar(50),
--	Email nvarchar(70) not null unique
--)

--insert into Employees 
--values('Medine', 'Eliyeva', 'medine@code.az'), 
--('Il', 'Qarayev', 'il@code.az'),
--('Mil', 'Qarayev', 'mil@code.az'),
--('Amil', 'Qarayev', 'amil@code.az'),
--('Kamil', 'Qarayev', 'kamil@code.az')

--select *
--into OldEmployees
--from Employees

--truncate table OldEmployees

--alter trigger OnEmployeeDeleted
--on Employees
--after delete
--as
--begin
--	insert into OldEmployees select * from deleted
--end

--select *
--into CopyEmployees
--from Employees

--drop table CopyEmployees

--create trigger OnEmployeesInsertAndUpdate
--on Employees
--after insert
--as
--begin
--	insert into CopyEmployees select * from inserted
--end


--insert into Employees values('Ad', 'Quluzade', 'ad@code.az'), 
--							('Şad', 'Quluzade', 'shad@code.az'),
--							('Reşad', 'Quluzade', 'reshad@code.az')



--alter trigger OnEmployeesUpdate
--on Employees
--after update
--as
--begin
-- update CopyEmployees 
-- set 
-- Firstname = (select Firstname from inserted where inserted.Id = Id),
-- Lastname = (select Lastname from inserted where inserted.Id = Id),
-- Email = (select Email from inserted where inserted.Id = Id)
-- where Id = (select Id from deleted where deleted.Id = Id)
--end


select * from Employees order by Id
select * from CopyEmployees order by Id

update Employees 
set Email = Email + 'zz'
where Id = 12

