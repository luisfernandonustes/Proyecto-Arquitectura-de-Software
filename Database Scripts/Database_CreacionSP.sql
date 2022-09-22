/****** Object:  StoredProcedure [dbo].[spAccesoSistema]    Script Date: 21/09/2022 01:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spAccesoSistema]
( @prmUser varchar(50),
  @prmPass varchar(50)
)
AS
	BEGIN
		SELECT E.idEmpleado, E.usuario, E.clave, E.nombres, E.apPaterno, E.apMaterno, E.nroDocumento
		FROM Empleado E
		WHERE E.usuario = @prmUser AND E.clave = @prmPass
	END
GO
/****** Object:  StoredProcedure [dbo].[spAccesoSistemaUsuario]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAccesoSistemaUsuario]
( @prmUser varchar(50),
  @prmPass varchar(50)
)
AS
	BEGIN
		SELECT U.idUsuario, U.usuario, U.clave, E.nombres, E.apPaterno, E.apMaterno, E.nroDocumento, U.tipoUser,E.idEmpleado
		FROM Usuario U
		INNER JOIN Empleado E ON (U.idEmpleado = E.idEmpleado)
		WHERE U.usuario = @prmUser AND U.clave = @prmPass AND U.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaMenu]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizaMenu]
(@prmIdMenu int ,
 @prmNombreMenu varchar(200),
 @prmUrlMenu varchar(200),
 @prmIdMenuParent int,
 @prmIsSubMenu bit,
 @prmEstado bit)
AS
	BEGIN
		UPDATE Menu
		SET nombre = @prmNombreMenu, 
		    url = @prmUrlMenu,
			idMenuParent = @prmIdMenuParent,
			isSubmenu = @prmIsSubMenu,
			estado = @prmEstado
		WHERE idMenu = @prmIdMenu
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosEnfermera]
(@prmIdEnfermera int,
@prmDocumento varchar(50)

)
as
	begin
	declare @idemple int;

	 set @idemple =  (select idEmpleado 
	from Enfermera where idEnfermera = @prmIdEnfermera)
		
		
		update Empleado
		set nroDocumento = @prmDocumento
		where Empleado.idEmpleado = @idemple
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosMedico]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosMedico]
(@prmIdMedico int,
@prmDocumento varchar(50)

)
as
	begin
	declare @idemple int;

	 set @idemple =  (select idEmpleado 
	from Medico where idMedico = @prmIdMedico)
		
		
		update Empleado
		set nroDocumento = @prmDocumento
		where Empleado.idEmpleado = @idemple
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosPaciente]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosPaciente]
(@prmIdPaciente int,
@prmDireccion varchar(300))
as
	begin
		update Paciente
		set Paciente.direccion = @prmDireccion
		where Paciente.idPaciente = @prmIdPaciente
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosUsuario]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosUsuario]
(@prmIdUsuario INT,
@prmUsuario VARCHAR(50),
@prmClave VARCHAR(50),
@prmTipUser VARCHAR(50)
)
as
	begin
	
		update Usuario
		set usuario = @prmUsuario,clave =@prmClave,tipoUser = @prmTipUser
		where idUsuario = @prmIdUsuario
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarEstadoCita]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarEstadoCita]
(@prmIdCita INT, @prmEstado varchar(1))
AS
	BEGIN
		UPDATE Cita
		SET estado = @prmEstado -- Atendido
		WHERE idCita = @prmIdCita
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarHorarioAtencion]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarHorarioAtencion]
(@prmIdMedico int,
 @prmIdHorario int,
 @prmFecha datetime,
 @prmHora varchar(5)
)
AS
	BEGIN
		DECLARE @idHora int;

		SET @idHora = (SELECT H.idHora FROM Hora  H WHERE H.hora = RTRIM(@prmHora));

		UPDATE HA
		SET HA.fecha = @prmFecha,
		    HA.idHoraInicio = @idHora
		FROM HorarioAtencion HA
		WHERE HA.idHorarioAtencion = @prmIdHorario
		AND HA.idMedico = @prmIdMedico
		
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarHorarioAtencionEstado]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarHorarioAtencionEstado]
( @prmIdHorarioAtencion int
)
AS
	BEGIN
		UPDATE HorarioAtencion 
		set estado = 0
		WHERE idHorarioAtencion = @prmIdHorarioAtencion

	END

GO
/****** Object:  StoredProcedure [dbo].[spBuscarEmpleado]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarEmpleado]
(@prmNroDocumento varchar(8))
AS
	BEGIN
		SELECT E.idEmpleado
			 , E.nombres
			 , E.apPaterno
			 , E.apMaterno
			 , E.nroDocumento
			 , TE.descripcion
			 , E.usuario
		FROM Empleado E 
		INNER JOIN TipoEmpleado TE ON (E.idTipoEmpleado = TE.idTipoEmpleado)
		WHERE E.nroDocumento = @prmNroDocumento
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarEnfermera] 
(@prmDni varchar(8))
AS
	BEGIN
		SELECT M.idEnfermera
			 , E.idEmpleado
			 , E.nombres as nombre
			 , E.apPaterno
			 , E.apMaterno
			 ,M.tipoEnfermera
			 , M.estado as estadoEnfermera
		FROM Enfermera M 
		INNER JOIN Empleado E ON (M.idEmpleado = E.idEmpleado)
		WHERE M.estado = 1
		AND E.nroDocumento = @prmDni
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarMedico]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBuscarMedico] 
(@prmDni varchar(8))
AS
	BEGIN
		SELECT M.idMedico
			 , E.idEmpleado
			 , E.nombres as nombre
			 , E.apPaterno
			 , E.apMaterno
			 , ES.idEspecialidad
			 , ES.descripcion
			 , M.estado as estadoMedico
		FROM Medico M 
		INNER JOIN Empleado E ON (M.idEmpleado = E.idEmpleado)
		INNER JOIN Especialidad ES ON (M.idEspecialidad = ES.idEspecialidad)
		WHERE M.estado = 1
		AND E.nroDocumento = @prmDni
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarPacienteDNI]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarPacienteDNI]
(@prmDni varchar(10)
)
AS
	BEGIN
		SELECT P.idPaciente
		     , P.nombres AS Nombres
			 , P.apPaterno AS ApPaterno
			 , P.apMaterno AS ApMaterno
			 , P.telefono AS Telefono
			 , P.edad AS Edad
			 , P.sexo AS Sexo
		FROM Paciente P
		WHERE nroDocumento = @prmDni
		and p.estado = 'True'
	END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarPacienteIdCita]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarPacienteIdCita]
(@prmIdCita INT)
AS
	BEGIN
		DECLARE @prmIdPaciente INT
		SET @prmIdPaciente = (SELECT idPaciente FROM Cita WHERE idCita = @prmIdCita)
		
		SELECT idPaciente, nombres, apPaterno, apMaterno, edad, sexo
		FROM  Paciente
		WHERE idPaciente = @prmIdPaciente
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarEnfermera]
(@prmIdEnfermera int)
AS
	BEGIN

	   DECLARE @idem int;
	   set @idem =(Select idEmpleado from Enfermera 
	   where idEnfermera = @prmIdEnfermera)

		UPDATE Enfermera
		SET estado = 0
		WHERE idEnfermera = @prmIdEnfermera

		UPDATE Empleado
		SET estado = 0
		WHERE idEmpleado = @idem
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarHorarioAtencion]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarHorarioAtencion]
( @prmIdHorarioAtencion int
)
AS
	BEGIN
		UPDATE HorarioAtencion
		SET estado = 0
		WHERE idHorarioAtencion = @prmIdHorarioAtencion
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarHorarioAtencionEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarHorarioAtencionEnfermera]
( @prmIdHorarioAtencion int
)
AS
	BEGIN
		UPDATE HorarioAtencionEnfermera
		SET estado = 0
		WHERE idHorarioAtencionEnfermera = @prmIdHorarioAtencion
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMedico]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMedico]
(@prmIdMedico int)
AS
	BEGIN
	    DECLARE @idem int;
	   set @idem =(Select idEmpleado from Medico
	   where idMedico = @prmIdMedico)

		UPDATE Medico
		SET estado = 0
		WHERE idMedico = @prmIdMedico

		UPDATE Empleado
		SET estado = 0
		WHERE idEmpleado = @idem
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMenu]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMenu]
(@prmIdMenu int)
AS
	BEGIN
		UPDATE Menu
		SET estado = 0
		WHERE idMenu = @prmIdMenu
	END

GO
/****** Object:  StoredProcedure [dbo].[spEliminarPaciente]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPaciente]
(@prmIdPaciente int)
AS
	BEGIN
		UPDATE Paciente
		SET estado = 0
		WHERE idPaciente = @prmIdPaciente
	END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarUsuario]
(@prmIdUsuario int)
AS
	BEGIN

		UPDATE Usuario
		SET estado = 0
		WHERE idUsuario = @prmIdUsuario
	END
GO
/****** Object:  StoredProcedure [dbo].[spListaHorariosAtencion]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListaHorariosAtencion]
(@prmIdMedico int
)
AS
	BEGIN
		SELECT M.idMedico, HA.idHorarioAtencion, HA.fecha, H.hora
		FROM Medico M
		INNER JOIN HorarioAtencion HA ON (M.idMedico = HA.idMedico)
		INNER JOIN Hora H ON (HA.idHoraInicio = H.idHora)
		WHERE M.idMedico = @prmIdMedico
		AND  HA.fecha >= CONVERT(DATE, GETDATE())
		AND HA.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListaHorariosAtencionEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListaHorariosAtencionEnfermera]
(@prmIdEnfermera int
)
AS
	BEGIN
		SELECT M.idEnfermera, HAE.idHorarioAtencionEnfermera, HAE.fecha, HAE.Turno
		FROM Enfermera M
		INNER JOIN HorarioAtencionEnfermera HAE ON (M.idEnfermera = HAE.idEnfermera)
		WHERE M.idEnfermera = @prmIdEnfermera
		AND  HAE.fecha >= CONVERT(DATE, GETDATE())
		AND HAE.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListaMenuPrincipal]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListaMenuPrincipal]
AS
	BEGIN
		SELECT 0 idMenu, '-- Sin Menú --' nombre
		UNION
		SELECT idMenu, nombre
		FROM Menu
		WHERE url = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarCitas]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCitas]
AS
	BEGIN
		SELECT C.idCita, C.idMedico, C.idPaciente, C.fechaReserva, C.hora, 
			   P.nombres, P.apPaterno, P.apMaterno, P.edad, P.sexo, 
			   P.nroDocumento, P.direccion,E.descripcion
		FROM Cita AS C inner join Paciente AS P ON C.idPaciente = P.idPaciente
		INNER JOIN Medico as M on M.idMedico = C.idMedico
		INNER JOIN Especialidad as E on E.idEspecialidad = M.idEspecialidad
		WHERE --CONVERT(VARCHAR(10), C.fechaReserva, 103) = (SELECT CONVERT(VARCHAR(10), GETDATE(), 103)) AND
			  C.estado = 'P' AND -- P = 'Pendiente', A = 'Atendida'
			  P.estado = 1 AND C.fechaReserva >= CONVERT(DATE, GETDATE()) 

		ORDER BY C.idCita Desc
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarCitasDNI]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCitasDNI]
(@prmDNI varchar(10))
AS
	BEGIN
		SELECT C.idCita, C.idMedico, C.idPaciente, C.fechaReserva, C.hora, 
			   P.nombres, P.apPaterno, P.apMaterno, P.edad, P.sexo, 
			   P.nroDocumento, P.direccion,E.descripcion
		FROM Cita AS C inner join Paciente AS P ON C.idPaciente = P.idPaciente
		INNER JOIN Medico as M on M.idMedico = C.idMedico
		INNER JOIN Especialidad as E on E.idEspecialidad = M.idEspecialidad
		WHERE --CONVERT(VARCHAR(10), C.fechaReserva, 103) = (SELECT CONVERT(VARCHAR(10), GETDATE(), 103)) AND
			  C.estado = 'P' AND -- P = 'Pendiente', A = 'Atendida'
			  P.estado = 1 AND C.fechaReserva >= CONVERT(DATE, GETDATE()) 
			  AND P.nroDocumento = @prmDNI
		ORDER BY C.idCita Desc
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarCitasESPECIALIDAD]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCitasESPECIALIDAD]
(@prmEspecialidad varchar(10))
AS
	BEGIN
		SELECT C.idCita, C.idMedico, C.idPaciente, C.fechaReserva, C.hora, 
			   P.nombres, P.apPaterno, P.apMaterno, P.edad, P.sexo, 
			   P.nroDocumento, P.direccion,E.descripcion
		FROM Cita AS C inner join Paciente AS P ON C.idPaciente = P.idPaciente
		INNER JOIN Medico as M on M.idMedico = C.idMedico
		INNER JOIN Especialidad as E on E.idEspecialidad = M.idEspecialidad
		WHERE --CONVERT(VARCHAR(10), C.fechaReserva, 103) = (SELECT CONVERT(VARCHAR(10), GETDATE(), 103)) AND
			  C.estado = 'P' AND -- P = 'Pendiente', A = 'Atendida'
			  P.estado = 1 AND C.fechaReserva >= CONVERT(DATE, GETDATE()) 
			  AND E.descripcion = @prmEspecialidad
		ORDER BY C.idCita Desc
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarCitasFECHA]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCitasFECHA]
(@prmfecha datetime)
AS
	BEGIN
		SELECT C.idCita, C.idMedico, C.idPaciente, C.fechaReserva, C.hora, 
			   P.nombres, P.apPaterno, P.apMaterno, P.edad, P.sexo, 
			   P.nroDocumento, P.direccion,E.descripcion
		FROM Cita AS C inner join Paciente AS P ON C.idPaciente = P.idPaciente
		INNER JOIN Medico as M on M.idMedico = C.idMedico
		INNER JOIN Especialidad as E on E.idEspecialidad = M.idEspecialidad
		WHERE --CONVERT(VARCHAR(10), C.fechaReserva, 103) = (SELECT CONVERT(VARCHAR(10), GETDATE(), 103)) AND
			  C.estado = 'P' AND -- P = 'Pendiente', A = 'Atendida'
			  P.estado = 1 AND C.fechaReserva >= CONVERT(DATE, GETDATE()) 
			  AND C.fechaReserva = @prmfecha
		ORDER BY C.idCita Desc
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarEnfermeras]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarEnfermeras]
AS
	BEGIN
		SELECT EN.idEnfermera
		     , E.nombres
			 , E.apPaterno
			 , E.apMaterno
			 , E.nroDocumento
			 , EN.tipoEnfermera
		FROM Enfermera EN
		INNER JOIN Empleado E ON EN.idEmpleado = E.idEmpleado
		WHERE EN.estado = 1 and E.estado = 1 
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarEspecialidades]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarEspecialidades]
AS
	BEGIN
		SELECT E.idEspecialidad, E.descripcion
		FROM Especialidad E
		WHERE E.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarHorariosAtencion]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarHorariosAtencion]
( @prmIdEspecialidad INT
)
AS
	BEGIN
		SELECT HA.idHorarioAtencion, HA.fecha, M.idMedico, E.nombres,E.apPaterno,E.apMaterno,E.nroDocumento, H.idHora, H.hora
		FROM HorarioAtencion HA 
		INNER JOIN Medico M ON (HA.idMedico = M.idMedico)
		INNER JOIN Empleado E ON (M.idEmpleado = E.idEmpleado)
		INNER JOIN Hora H ON (HA.idHoraInicio = H.idHora)
		WHERE M.idEspecialidad = @prmIdEspecialidad
		AND HA.estado = 'true'
		AND HA.fecha >= CONVERT(DATE, GETDATE()) 
		AND M.estado = 'true'
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarHorariosAtencionPorFecha]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarHorariosAtencionPorFecha]
( @prmIdEspecialidad INT,
  @prmFecha DATE
)
AS
	BEGIN
		SELECT HA.idHorarioAtencion, HA.fecha, M.idMedico, E.nombres, H.idHora, H.hora
		FROM HorarioAtencion HA 
		INNER JOIN Medico M ON (HA.idMedico = M.idMedico)
		INNER JOIN Empleado E ON (M.idEmpleado = E.idEmpleado)
		INNER JOIN Hora H ON (HA.idHoraInicio = H.idHora)
		WHERE CAST(HA.fecha AS DATE) = @prmFecha 
		AND M.idEspecialidad = @prmIdEspecialidad
		AND HA.estado = 'true'
		AND HA.fecha >= CONVERT(DATE, GETDATE()) 
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicos]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicos]
AS
	BEGIN
		SELECT M.idMedico
		     , E.nombres
			 , E.apPaterno
			 , E.apMaterno
			 , E.nroDocumento
			 , ES.descripcion
		FROM Medico M
		INNER JOIN Empleado E ON M.idEmpleado = E.idEmpleado
		INNER JOIN Especialidad ES on M.idEspecialidad = ES.idEspecialidad
		WHERE M.estado = 1 and E.estado = 1 and Es.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMenu]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMenu]
AS
	BEGIN
		SELECT idMenu, 
			   nombre, 
			   isSubmenu, 
			   ISNULL(url, '') url, 
			   ISNULL(idMenuParent, 0) idMenuParent, 
			   estado,
			   show
		FROM Menu
		--WHERE estado = 1 
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarMenuPermisos]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMenuPermisos]
(@prmIdEmpleado INT,
 @prmOption INT)
AS
	SET NOCOUNT ON
	BEGIN
		CREATE TABLE #TMPPERMISOS( IDTMPPERMISOS INT IDENTITY(1,1) NOT NULL
								 , IDEMPLEADO INT
								 , ENOMBRES VARCHAR(50)
								 , TIPOEMPLEADO VARCHAR(100)
								 , IdMenu INT
								 , nombre VARCHAR(200)
								 , isSubMenu BIT
								 , url VARCHAR(200)
								 , idMenuParent INT
								 , orden INT)

		INSERT INTO #TMPPERMISOS(IDEMPLEADO, ENOMBRES, TIPOEMPLEADO, IdMenu, nombre, isSubMenu, url, idMenuParent, orden)
		SELECT E.idEmpleado
			 , E.nombres
			 , TE.descripcion
			 , M.idMenu
			 , M.nombre
			 , M.isSubmenu
			 , M.url
			 , ISNULL(M.idMenuParent, 0)
			 , M.orden
		FROM Empleado E 
		INNER JOIN TipoEmpleado TE ON (E.idTipoEmpleado = TE.idTipoEmpleado)
		INNER JOIN Permisos P ON(E.idEmpleado = P.idEmpleado)
		INNER JOIN Menu M ON (P.idMenu = M.idMenu)
		WHERE E.idEmpleado = @prmIdEmpleado AND E.estado = 1 AND M.estado = 1
		ORDER BY M.orden, M.idMenu


		IF @prmOption = 0
			BEGIN
				SELECT IdMenu
					 , nombre
					 , isSubMenu
					 , url
					 , idMenuParent
				FROM #TMPPERMISOS
			END
		ELSE
			BEGIN
				SELECT IdMenu
					 , nombre
					 , isSubMenu
					 , url
					 , ISNULL(idMenuParent, 0)idMenuParent
				FROM Menu
				WHERE idMenu NOT IN(SELECT IDMENU FROM #TMPPERMISOS)
			END

		DROP TABLE #TMPPERMISOS

	END

GO
/****** Object:  StoredProcedure [dbo].[spListarPacientes]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPacientes]
AS
	BEGIN
		SELECT P.idPaciente
		     , P.nombres
			 , P.apPaterno
			 , P.apMaterno
			 , P.edad
			 , P.sexo
			 , P.nroDocumento
			 , P.direccion
		FROM Paciente P
		WHERE P.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuarios]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarUsuarios]
AS
	BEGIN
		SELECT U.idUsuario
		     , E.nombres
			 , E.apPaterno
			 , E.apMaterno
		     , U.usuario
			 , U.clave
			 , E.nroDocumento
			 ,U.tipoUser
		FROM Usuario U
		INNER JOIN Empleado E ON e.idEmpleado = U.idEmpleado
		WHERE U.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spMenuPorEmpleado]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMenuPorEmpleado] 
(@prmIdEmpleado int)
AS
	BEGIN
		SELECT M.idMenu, 
			   M.nombre, M.url, 
			   M.isSubmenu, 
			   ISNULL(M.idMenuParent, 0) idMenuParent, 
			   M.estado MEstado,
			   P.estado,
			   M.show
		FROM Menu M INNER JOIN 
			 Permisos P ON (M.idMenu = P.idMenu) INNER JOIN 
			 Empleado E ON (E.idEmpleado = P.idEmpleado)
		WHERE E.idEmpleado = @prmIdEmpleado 
		  AND P.estado = 1	
		ORDER BY M.orden
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCita]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarCita]
( @idMedico int,
  @idPaciente int,
  @fechaReserva datetime,
  @hora varchar(5)
)
AS
	BEGIN
		INSERT INTO Cita(idMedico, idPaciente, fechaReserva, estado, hora)
		VALUES(@idMedico, @idPaciente, @fechaReserva, 'P', @hora)
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarDiagnostico]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarDiagnostico]
(@prmIdPaciente INT,
 @prmObservacion VARCHAR(500),
 @prmDiagnostico VARCHAR(500)
 )
AS
	SET NOCOUNT ON
	BEGIN
		DECLARE @prmFecha DATETIME = GETDATE()
		DECLARE @prmEstado BIT = 1
		DECLARE @prmIdHistoriaClinica INT
		-- guardar la historia clinica
		IF NOT EXISTS(SELECT TOP 1 idHistoriaClinica FROM HistoriaClinica WHERE idPaciente = @prmIdPaciente)
			BEGIN
				INSERT INTO HistoriaClinica(idPaciente, fechaApertura, estado)
				VALUES(@prmIdPaciente, @prmFecha, @prmEstado)

				SET @prmIdHistoriaClinica = SCOPE_IDENTITY()
			END
		ELSE
			BEGIN
				SET @prmIdHistoriaClinica = (SELECT TOP 1 idHistoriaClinica FROM HistoriaClinica WHERE idPaciente = @prmIdPaciente)
			END

		-- guardar el diagnostico	
		INSERT INTO Diagnostico(idHistoriaClinica, fechaEmision, observacion, estado,recetaMedica)
		VALUES(@prmIdHistoriaClinica, @prmFecha, @prmDiagnostico, @prmEstado,@prmObservacion)	
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarEliminarPermiso]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarEliminarPermiso]
(@prmIdMenu int,
 @prmIdEmpleado int,
 @prmOpcion int)
AS
	SET NOCOUNT ON
	BEGIN
		IF @prmOpcion = 1  -- CREAR
			BEGIN
				
				IF NOT EXISTS(SELECT TOP 1 1 FROM Permisos WHERE idEmpleado = @prmIdEmpleado AND idMenu = @prmIdMenu)
					BEGIN
						INSERT INTO Permisos(idMenu, idEmpleado, estado)
						VALUES(@prmIdMenu, @prmIdEmpleado, 1)
					END
			END
		ELSE IF @prmOpcion = 0
			BEGIN		   -- ELIMINAR 
				DELETE FROM Permisos 
				WHERE idEmpleado = @prmIdEmpleado AND
					  idMenu = @prmIdMenu
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarEnfermera]
(
@prmIdTipoEmp INT ,
@prmNombres VARCHAR(50),
@prmApPaterno VARCHAR(50),
@prmApMaterno VARCHAR(50),
@prmNroDoc VARCHAR(8), 
@prmTipoEnfermera varchar(50),
@prmEstado bit
)
AS
	BEGIN

	    DECLARE @idEmpleado int;

		INSERT INTO Empleado(idTipoEmpleado, nombres,apPaterno, apMaterno, nroDocumento,estado)
		VALUES(@prmIdTipoEmp, @prmNombres,@prmApPaterno, @prmApMaterno,@prmNroDoc, @prmEstado);

		-- OBTENER EL ULTIMO REGISTRO INSERTADO EN LA TABLA 
			SET @idEmpleado= SCOPE_IDENTITY();

		INSERT INTO Enfermera(idEmpleado, tipoEnfermera,estado)
		VALUES(@idEmpleado, @prmTipoEnfermera, @prmEstado);
		
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarHorarioAtencion]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarHorarioAtencion]
(@prmIdMedico int,
 @prmHora varchar(5),
 @prmFecha datetime
)
AS
	BEGIN
		-- TRY CATCH
		BEGIN TRY
			DECLARE @hora int;
			DECLARE @idHorarioAtencion int;
			
			-- OBTENER EL ID RESPECTIVO DEL PARAMETRO HORA
			SET @hora = (SELECT H.idHora FROM Hora H WHERE H.hora = @prmHora);
						
			-- INSERT
			INSERT INTO HorarioATencion(idMedico, fecha, idHoraInicio, estado)
			VALUES(@prmIdMedico, @prmFecha, @hora, 1); 
			
			-- OBTENER EL ULTIMO REGISTRO INSERTADO EN LA TABLA HORARIOATENCION
			SET @idHorarioAtencion = SCOPE_IDENTITY();

			-- SELECT
			SELECT HA.idHorarioAtencion, HA.fecha, H.idHora, H.hora, HA.estado
			FROM HorarioAtencion HA
			INNER JOIN Hora H ON(HA.idHoraInicio = H.idHora)
			WHERE HA.idHorarioAtencion = @idHorarioAtencion
		END TRY
		BEGIN CATCH
			ROLLBACK;
			-- RAISERROR('',,,,'')
			-- PRINT 'mensaje'
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarHorarioAtencionEnfermera]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarHorarioAtencionEnfermera]
(@prmIdEnfermera int,
 @prmTurno varchar(10),
 @prmFecha datetime
)
AS
	BEGIN
		-- TRY CATCH
		BEGIN TRY

			DECLARE @idHorarioAtencion int;
			
						
			-- INSERT
			INSERT INTO HorarioAtencionEnfermera(idEnfermera, fecha, Turno, estado)
			VALUES(@prmIdEnfermera, @prmFecha, @prmTurno, 1); 
			
			-- OBTENER EL ULTIMO REGISTRO INSERTADO EN LA TABLA HORARIOATENCION
			SET @idHorarioAtencion = SCOPE_IDENTITY();

			-- SELECT
			SELECT HA.idHorarioAtencionEnfermera, HA.fecha,HA.Turno, HA.estado
			FROM HorarioAtencionEnfermera HA
			WHERE HA.idHorarioAtencionEnfermera = @idHorarioAtencion
		END TRY
		BEGIN CATCH
			ROLLBACK;
			-- RAISERROR('',,,,'')
			-- PRINT 'mensaje'
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMedico]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMedico]
(
@prmIdTipoEmp INT ,
@prmNombres VARCHAR(50),
@prmApPaterno VARCHAR(50),
@prmApMaterno VARCHAR(50),
@prmEspecialidad INT,
@prmNroDoc VARCHAR(8), 
@prmEstado bit
)
AS
	BEGIN

	    DECLARE @idEmpleado int;

		INSERT INTO Empleado(idTipoEmpleado, nombres,apPaterno, apMaterno, nroDocumento,estado)
		VALUES(@prmIdTipoEmp, @prmNombres,@prmApPaterno, @prmApMaterno,@prmNroDoc, @prmEstado);

		-- OBTENER EL ULTIMO REGISTRO INSERTADO EN LA TABLA 
			SET @idEmpleado= SCOPE_IDENTITY();

		INSERT INTO Medico(idEmpleado, idEspecialidad,estado)
		VALUES(@idEmpleado, @prmEspecialidad, @prmEstado);
		
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMenu]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMenu]
(@prmNombre varchar(100),
 @prmIsSubmenu bit,
 @prmUrl varchar(200),
 @prmMenuParent int)
 AS
	BEGIN
		DECLARE @prmIdMenuParent INT
		IF @prmIsSubmenu = 0
			BEGIN
				
				IF @prmMenuParent = 0
				BEGIN SET @prmIdMenuParent = NULL 
				END 
				ELSE 
				BEGIN SET @prmIdMenuParent = @prmMenuParent 
				END

				INSERT INTO Menu(nombre, isSubmenu, url, idMenuParent, estado, show, orden)
				VALUES(@prmNombre, @prmIsSubmenu, @prmUrl, @prmIdMenuParent, 1, 1, 7)
			END
		ELSE 
			BEGIN 
					INSERT INTO Menu(nombre, isSubmenu, url, idMenuParent, estado, show, orden)
					VALUES(@prmNombre, @prmIsSubmenu, @prmUrl, @prmMenuParent, 1, 1, 7)
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPaciente]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarPaciente]
(
@prmNombres VARCHAR(50),
@prmApPaterno VARCHAR(50),
@prmApMaterno VARCHAR(50),
@prmEdad INT,
@prmSexo CHAR(1),
@prmNroDoc VARCHAR(8), 
@prmDireccion VARCHAR(150),
@prmTelefono VARCHAR(20),
@prmEstado bit
)
AS
	BEGIN
		INSERT INTO Paciente(nombres, apPaterno, apMaterno, edad, sexo, nroDocumento, direccion, telefono, estado)
		VALUES(@prmNombres, @prmApPaterno, @prmApMaterno, @prmEdad, @prmSexo, @prmNroDoc, @prmDireccion, @prmTelefono, @prmEstado);
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 28/09/2021 12:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
(
@prmUsuario VARCHAR(50),
@prmClave VARCHAR(50),
@prmIdEmpleado int ,
@prmTipUser VARCHAR(50),
@prmEstado bit
)
AS
	BEGIN

		INSERT INTO Usuario(usuario, clave,estado, idEmpleado,tipoUser)
		VALUES(@prmUsuario, @prmClave,1, @prmIdEmpleado,@prmTipUser);

	END
GO