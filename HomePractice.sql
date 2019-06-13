--use practice

--PROCEDURE WITHOUT PARAMETERS
--create procedure mypro
--as
--select * from players

--execute mypro


--PROCEDURE WITH PARAMETERS
--alter procedure mypro2 @name nvarchar(50)
--as
--select * from players
--where name = @name

--*simple execute*
--execute mypro2 'marcus'
-- or
--*named parameter execute*
--execute mypro2 @name = 'marcus'


--PROCEDURE WITH OUTPUT
--create procedure mypro3(@name nvarchar(30),@surname nvarchar(30),@result nvarchar(60) output)
--as
--begin
--	select @result = @name + @surname
--		from players
--end

--declare @r nvarchar(60);
--execute mypro3 'marcus','rashford',@r output
--print @r




-- SCALAR FUNCTIONS
--create function myfunc (@name nvarchar(30))
--returns nvarchar(30)
--as
--begin
--	return @name + 'GREAT'
--end

--select dbo.myfunc(name) from players




--create function myfunc2(@name nvarchar(30),@surname nvarchar(30))
--returns nvarchar(60)
--as
--begin
--	return left(@name,1) + '.' + @surname
--end

--select dbo.myfunc2(name,surname) from players




--create function myfunc3(@name nvarchar(30))
--returns int
--as
--begin
--	declare @result int
--	select @result = count(name) from players
--	return @result
--end

--alter function myfunc3(@name nvarchar(30))
--returns int
--as
--begin
--	declare @result int
--	select @result = count(name) from players where name = @name
--	return @result
--end

--select dbo.myfunc3('marcus')




--TABLE FUNCTIONS
--create function myfunc4(@name nvarchar(30))
--returns table
--as
--	return (select * from players where name = @name)

--select * from dbo.myfunc4('marcus')