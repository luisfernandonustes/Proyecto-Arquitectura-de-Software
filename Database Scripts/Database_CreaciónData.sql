
SET IDENTITY_INSERT [dbo].[DiaSemana] ON 
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (1, N'Lunes')
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (2, N'Martes')
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (3, N'Miércoles')
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (4, N'Jueves')
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (5, N'Viernes')
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (6, N'Sábado')
INSERT [dbo].[DiaSemana] ([idDiaSemana], [nombreDiaSemana]) VALUES (7, N'Domingo')
SET IDENTITY_INSERT [dbo].[DiaSemana] OFF



SET IDENTITY_INSERT [dbo].[Especialidad] ON 
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (1, N'Pediatría', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (2, N'Odontología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (3, N'Medicina Interna', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (4, N'Cardiología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (5, N'Oncología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (6, N'Gastroenterología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (7, N'Ginecología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (8, N'Oftalmología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (9, N'Traumotología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (10, N'Otorrinolaringología', 1)
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion], [estado]) VALUES (11, N'Dermalogía', 1)
SET IDENTITY_INSERT [dbo].[Especialidad] OFF


SET IDENTITY_INSERT [dbo].[Hora] ON 
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (1, N'09:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (2, N'09:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (3, N'10:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (4, N'10:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (5, N'11:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (6, N'11:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (7, N'12:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (8, N'12:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (9, N'13:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (10, N'13:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (11, N'14:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (12, N'14:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (13, N'15:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (14, N'15:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (15, N'16:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (16, N'16:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (17, N'17:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (18, N'17:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (19, N'18:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (20, N'18:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (21, N'19:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (22, N'19:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (23, N'20:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (24, N'20:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (25, N'21:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (26, N'21:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (27, N'22:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (28, N'06:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (29, N'07:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (30, N'08:00')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (31, N'06:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (32, N'07:30')
INSERT [dbo].[Hora] ([idHora], [hora]) VALUES (33, N'08:30')
SET IDENTITY_INSERT [dbo].[Hora] OFF



SET IDENTITY_INSERT [dbo].[Menu] ON 
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (1, N'Panel de Administración', 0, N'PanelGeneral.aspx', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (2, N'Registro', 0, N'', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (3, N'Registro de Pacientes', 1, N'GestionarPaciente.aspx', 2, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (4, N'Registro de Medicos', 1, N'GestionarMedico.aspx', 2, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (5, N'Registro de Enfermeras', 1, N'GestionarEnfermera.aspx', 2, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (6, N'Registro de Usuarios', 1, N'GestionarUsuario.aspx', 2, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (7, N'Reserva de Citas', 0, N'GestionarReservaCitas.aspx', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (8, N'Atención de Citas', 0, N'GestionarAtencionPaciente.aspx', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (9, N'Horarios', 0, N'', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (10, N'Horarios Medicos', 1, N'GestionarHorarioAtencion.aspx', 9, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (11, N'Horarios Enfermeras', 1, N'GestionarHorariosEnfermeras.aspx', 9, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (12, N'Gestionar Menus', 0, N'GestionarMenus.aspx', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (13, N'Administrar Permisos', 0, N'GestionarPermisos.aspx', NULL, 1, 1, 7)
INSERT [dbo].[Menu] ([idMenu], [nombre], [isSubmenu], [url], [idMenuParent], [estado], [show], [orden]) VALUES (14, N'Reportes', 0, N'GestionarReportes.aspx', NULL, 0, 1, 7)
SET IDENTITY_INSERT [dbo].[Menu] OFF


SET IDENTITY_INSERT [dbo].[TipoEmpleado] ON 
INSERT [dbo].[TipoEmpleado] ([idTipoEmpleado], [descripcion], [estado]) VALUES (2, N'Seguridad', 1)
INSERT [dbo].[TipoEmpleado] ([idTipoEmpleado], [descripcion], [estado]) VALUES (1002, N'Médico', 1)
INSERT [dbo].[TipoEmpleado] ([idTipoEmpleado], [descripcion], [estado]) VALUES (1003, N'Enfermera(o)', 1)
INSERT [dbo].[TipoEmpleado] ([idTipoEmpleado], [descripcion], [estado]) VALUES (1004, N'Usuario', 1)
SET IDENTITY_INSERT [dbo].[TipoEmpleado] OFF



SET IDENTITY_INSERT [dbo].[Empleado] ON 
INSERT [dbo].[Empleado] ([idEmpleado], [idTipoEmpleado], [nombres], [apPaterno], [apMaterno], [nroDocumento], [estado], [imagen], [usuario], [clave]) VALUES (1, 2, N'SakCode', N'Benavides', N'Benavides',N'74942834', 1, NULL, N'security', N'security')
INSERT [dbo].[Empleado] ([idEmpleado], [idTipoEmpleado], [nombres], [apPaterno], [apMaterno], [nroDocumento], [estado], [imagen], [usuario], [clave]) VALUES (2, 1004, N'Arcangel', N'Carranza', N'Sopla', N'74942834', 1, NULL, N'arcangel', N'admin2121')
SET IDENTITY_INSERT [dbo].[Empleado] OFF


SET IDENTITY_INSERT [dbo].[Usuario] ON 
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [clave], [estado], [idEmpleado], [imagen], [tipoUser]) VALUES (1, N'security', N'security', 1, 1, NULL, N'Administrador')
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [clave], [estado], [idEmpleado], [imagen], [tipoUser]) VALUES (2, N'arcangel', N'admin2121', 1, 2, NULL, N'Invitado')
SET IDENTITY_INSERT [dbo].[Usuario] OFF




INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 1, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 2, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 3, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 4, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 5, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 6, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 7, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 8, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 9, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 10, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 11, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 12, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 13, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (1, 14, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (2, 1, 1)
INSERT [dbo].[Permisos] ([idEmpleado], [idMenu], [estado]) VALUES (2, 8, 1)