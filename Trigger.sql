USE [AEROPUERTO]
GO
/****** Object:  Trigger [dbo].[INSERTAR_AEROLINEAS]    Script Date: 07/11/2023 11:49:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[INSERTAR_AEROLINEAS]
on [dbo].[AEROLINEAS]
for insert 
as 
insert into Bitacora
Values(CURRENT_USER,Getdate(),@@SERVERNAME,'INSERT')