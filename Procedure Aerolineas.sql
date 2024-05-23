USE [AEROPUERTO]
GO
/****** Object:  StoredProcedure [dbo].[buscar_aerolineas]    Script Date: 15/11/2023 11:41:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---Nuevos CP
ALTER procedure [dbo].[buscar_aerolineas]
---crean las variables (parametros )
@nomb_aero char(30)
as begin
---- cuerpo del procedure

select *
from AEROLINEAS
where
AEROLINEAS.nombre_aerolineas like '%' + trim(@nomb_aero) + '%'



end
