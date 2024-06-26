USE [AEROPUERTO]
GO
/****** Object:  StoredProcedure [dbo].[tablas_exists]    Script Date: 15/11/2023 11:51:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[tablas_exists]
@nombre char(30) 
as
begin
if exists(
Select *
from INFORMATION_SCHEMA.TABLES
where
trim(TABLE_NAME) like '%'+ trim(@nombre)+ '%')
begin

Select *
from INFORMATION_SCHEMA.TABLES
where
trim(TABLE_NAME) like '%'+ trim(@nombre)+ '%'
end
else
begin
select'La tabla no existe'
end
end