CREATE DATABASE Obligatorio_Empresa_Buses
GO
USE [Obligatorio_Empresa_Buses]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[idBuses] [int] NOT NULL,
	[nroFila] [int] NOT NULL,
	[letra] [char](1) NOT NULL,
 CONSTRAINT [PK_Asientos] PRIMARY KEY CLUSTERED 
(
	[idBuses] ASC,
	[nroFila] ASC,
	[letra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](100) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[capacidad] [int] NOT NULL,
 CONSTRAINT [PK_Buses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Departamentos_Nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinos]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[infoGral] [varchar](255) NULL,
	[duracion] [int] NULL,
	[horaSalida] [time](7) NULL,
	[fecha] [date] NULL,
	[importe] [decimal](10, 2) NULL,
	[idTerminalOrigen] [int] NULL,
	[idTerminalDestino] [int] NULL,
	[nombreTerminalOrigen] [varchar](100) NULL,
	[nombreTerminalDestino] [varchar](100) NULL,
	[idDepartamentoTerminalOrigen] [int] NULL,
	[idDepartamentoTerminalDestino] [int] NULL,
	[fechaViaje] [date] NULL,
 CONSTRAINT [PK_Destinos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTerminal_Buses]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTerminal_Buses](
	[idTerminalOrigen] [int] NOT NULL,
	[idTerminalDestino] [int] NOT NULL,
	[nombreTerminalOrigen] [varchar](100) NULL,
	[nombreTerminalDestino] [varchar](100) NULL,
	[idDepartamentoTerminalOrigen] [int] NULL,
	[idDepartamentoTerminalDestino] [int] NULL,
	[idDestino] [int] NOT NULL,
	[idBus] [int] NOT NULL,
 CONSTRAINT [PK_DestinoTerminal_Buses] PRIMARY KEY CLUSTERED 
(
	[idTerminalOrigen] ASC,
	[idTerminalDestino] ASC,
	[idDestino] ASC,
	[idBus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mercosures]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mercosures](
	[idPasajero] [int] NOT NULL,
	[descuentoPasaje] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Mercosures] PRIMARY KEY CLUSTERED 
(
	[idPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mercosures_Beneficios]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mercosures_Beneficios](
	[idPasajero] [int] NOT NULL,
	[beneficio] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Mercosures_Beneficios] PRIMARY KEY CLUSTERED 
(
	[idPasajero] ASC,
	[beneficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[No_Mercosures]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[No_Mercosures](
	[idPasajero] [int] NOT NULL,
 CONSTRAINT [PK_No_Mercosures] PRIMARY KEY CLUSTERED 
(
	[idPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrigenesDestinos]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrigenesDestinos](
	[idOrigen] [int] NOT NULL,
	[idDestino] [int] NOT NULL,
	[nombreTerminalOrigen] [varchar](100) NULL,
	[nombreTerminalDestino] [varchar](100) NULL,
	[idDepartamentoTerminalOrigen] [int] NULL,
	[idDepartamentoTerminalDestino] [int] NULL,
 CONSTRAINT [PK_OrigenesDestinos] PRIMARY KEY CLUSTERED 
(
	[idOrigen] ASC,
	[idDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajes]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fueUtilizado] [bit] NULL,
	[fecha] [date] NULL,
	[idDestino] [int] NULL,
	[idPasajero] [int] NULL,
	[fechaCompra] [date] NULL,
	[idBus] [int] NULL,
	[nroFila] [int] NULL,
	[letra] [char](1) NULL,
 CONSTRAINT [PK_Pasajes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terminales]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terminales](
	[idDepartamento] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Terminales] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[nombre] ASC,
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Terminales_Nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turistas]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turistas](
	[idPasajero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[primerApellido] [varchar](100) NOT NULL,
	[segundoApellido] [varchar](100) NULL,
	[tipoDocumento] [varchar](50) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[fechaNacimiento] [date] NULL,
	[correoElectronico] [varchar](100) NULL,
	[contraseña] [varchar](100) NULL,
	[idPais] [int] NULL,
 CONSTRAINT [PK_Turistas] PRIMARY KEY CLUSTERED 
(
	[idPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Turistas_CorreoElectronico] UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Turistas_NumeroDocumento] UNIQUE NONCLUSTERED 
(
	[numeroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turistas_Telefonos]    Script Date: 28/10/2024 21:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turistas_Telefonos](
	[idPasajero] [int] NOT NULL,
	[telefono] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Turistas_Telefonos] PRIMARY KEY CLUSTERED 
(
	[idPasajero] ASC,
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asientos]  WITH CHECK ADD  CONSTRAINT [FK_Asientos_Buses] FOREIGN KEY([idBuses])
REFERENCES [dbo].[Buses] ([id])
GO
ALTER TABLE [dbo].[Asientos] CHECK CONSTRAINT [FK_Asientos_Buses]
GO
ALTER TABLE [dbo].[Destinos]  WITH CHECK ADD  CONSTRAINT [FK_Destinos_Terminales_Destino] FOREIGN KEY([idTerminalDestino], [nombreTerminalDestino], [idDepartamentoTerminalDestino])
REFERENCES [dbo].[Terminales] ([id], [nombre], [idDepartamento])
GO
ALTER TABLE [dbo].[Destinos] CHECK CONSTRAINT [FK_Destinos_Terminales_Destino]
GO
ALTER TABLE [dbo].[Destinos]  WITH CHECK ADD  CONSTRAINT [FK_Destinos_Terminales_Origen] FOREIGN KEY([idTerminalOrigen], [nombreTerminalOrigen], [idDepartamentoTerminalOrigen])
REFERENCES [dbo].[Terminales] ([id], [nombre], [idDepartamento])
GO
ALTER TABLE [dbo].[Destinos] CHECK CONSTRAINT [FK_Destinos_Terminales_Origen]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [FK_DestinoTerminal_Buses_Buses] FOREIGN KEY([idBus])
REFERENCES [dbo].[Buses] ([id])
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [FK_DestinoTerminal_Buses_Buses]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [FK_DestinoTerminal_Buses_Destino] FOREIGN KEY([idTerminalDestino], [nombreTerminalDestino], [idDepartamentoTerminalDestino])
REFERENCES [dbo].[Terminales] ([id], [nombre], [idDepartamento])
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [FK_DestinoTerminal_Buses_Destino]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [FK_DestinoTerminal_Buses_Destinos] FOREIGN KEY([idDestino])
REFERENCES [dbo].[Destinos] ([id])
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [FK_DestinoTerminal_Buses_Destinos]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [FK_DestinoTerminal_Buses_NombreOrigen] FOREIGN KEY([nombreTerminalOrigen])
REFERENCES [dbo].[Terminales] ([nombre])
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [FK_DestinoTerminal_Buses_NombreOrigen]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [FK_DestinoTerminal_Buses_Origen] FOREIGN KEY([idTerminalOrigen], [nombreTerminalOrigen], [idDepartamentoTerminalOrigen])
REFERENCES [dbo].[Terminales] ([id], [nombre], [idDepartamento])
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [FK_DestinoTerminal_Buses_Origen]
GO
ALTER TABLE [dbo].[Mercosures]  WITH CHECK ADD  CONSTRAINT [FK_Mercosures_Turistas] FOREIGN KEY([idPasajero])
REFERENCES [dbo].[Turistas] ([idPasajero])
GO
ALTER TABLE [dbo].[Mercosures] CHECK CONSTRAINT [FK_Mercosures_Turistas]
GO
ALTER TABLE [dbo].[Mercosures_Beneficios]  WITH CHECK ADD  CONSTRAINT [FK_Mercosures_Beneficios_Mercosures] FOREIGN KEY([idPasajero])
REFERENCES [dbo].[Mercosures] ([idPasajero])
GO
ALTER TABLE [dbo].[Mercosures_Beneficios] CHECK CONSTRAINT [FK_Mercosures_Beneficios_Mercosures]
GO
ALTER TABLE [dbo].[No_Mercosures]  WITH CHECK ADD  CONSTRAINT [FK_No_Mercosures_Turistas] FOREIGN KEY([idPasajero])
REFERENCES [dbo].[Turistas] ([idPasajero])
GO
ALTER TABLE [dbo].[No_Mercosures] CHECK CONSTRAINT [FK_No_Mercosures_Turistas]
GO
ALTER TABLE [dbo].[OrigenesDestinos]  WITH CHECK ADD  CONSTRAINT [FK_OrigenesDestino_Destino] FOREIGN KEY([idDestino], [nombreTerminalDestino], [idDepartamentoTerminalDestino])
REFERENCES [dbo].[Terminales] ([id], [nombre], [idDepartamento])
GO
ALTER TABLE [dbo].[OrigenesDestinos] CHECK CONSTRAINT [FK_OrigenesDestino_Destino]
GO
ALTER TABLE [dbo].[OrigenesDestinos]  WITH CHECK ADD  CONSTRAINT [FK_OrigenesDestino_Origen] FOREIGN KEY([idOrigen], [nombreTerminalOrigen], [idDepartamentoTerminalOrigen])
REFERENCES [dbo].[Terminales] ([id], [nombre], [idDepartamento])
GO
ALTER TABLE [dbo].[OrigenesDestinos] CHECK CONSTRAINT [FK_OrigenesDestino_Origen]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Asientos_Fila] FOREIGN KEY([idBus], [nroFila], [letra])
REFERENCES [dbo].[Asientos] ([idBuses], [nroFila], [letra])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Asientos_Fila]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Destinos] FOREIGN KEY([idDestino])
REFERENCES [dbo].[Destinos] ([id])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Destinos]
GO
ALTER TABLE [dbo].[Pasajes]  WITH CHECK ADD  CONSTRAINT [FK_Pasajes_Turistas] FOREIGN KEY([idPasajero])
REFERENCES [dbo].[Turistas] ([idPasajero])
GO
ALTER TABLE [dbo].[Pasajes] CHECK CONSTRAINT [FK_Pasajes_Turistas]
GO
ALTER TABLE [dbo].[Terminales]  WITH CHECK ADD  CONSTRAINT [FK_Terminales_Departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([id])
GO
ALTER TABLE [dbo].[Terminales] CHECK CONSTRAINT [FK_Terminales_Departamentos]
GO
ALTER TABLE [dbo].[Turistas]  WITH CHECK ADD  CONSTRAINT [FK_Turistas_Paises] FOREIGN KEY([idPais])
REFERENCES [dbo].[Paises] ([id])
GO
ALTER TABLE [dbo].[Turistas] CHECK CONSTRAINT [FK_Turistas_Paises]
GO
ALTER TABLE [dbo].[Turistas_Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Turistas_Telefonos_Turistas] FOREIGN KEY([idPasajero])
REFERENCES [dbo].[Turistas] ([idPasajero])
GO
ALTER TABLE [dbo].[Turistas_Telefonos] CHECK CONSTRAINT [FK_Turistas_Telefonos_Turistas]
GO
ALTER TABLE [dbo].[Destinos]  WITH CHECK ADD  CONSTRAINT [CK_Destinos_Terminales_DepartamentoDistinct] CHECK  (([idDepartamentoTerminalOrigen]<>[idDepartamentoTerminalDestino]))
GO
ALTER TABLE [dbo].[Destinos] CHECK CONSTRAINT [CK_Destinos_Terminales_DepartamentoDistinct]
GO
ALTER TABLE [dbo].[Destinos]  WITH CHECK ADD  CONSTRAINT [CK_Destinos_Terminales_DistinctOriginDest] CHECK  (([idTerminalOrigen]<>[idTerminalDestino]))
GO
ALTER TABLE [dbo].[Destinos] CHECK CONSTRAINT [CK_Destinos_Terminales_DistinctOriginDest]
GO
ALTER TABLE [dbo].[Destinos]  WITH CHECK ADD  CONSTRAINT [CK_Destinos_Terminales_NombreDistinct] CHECK  (([nombreTerminalOrigen]<>[nombreTerminalDestino]))
GO
ALTER TABLE [dbo].[Destinos] CHECK CONSTRAINT [CK_Destinos_Terminales_NombreDistinct]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [CK_DestinoTerminal_Buses_DepartamentoDistinct] CHECK  (([idDepartamentoTerminalOrigen]<>[idDepartamentoTerminalDestino]))
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [CK_DestinoTerminal_Buses_DepartamentoDistinct]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [CK_DestinoTerminal_Buses_DistinctOriginDest] CHECK  (([idTerminalOrigen]<>[idTerminalDestino]))
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [CK_DestinoTerminal_Buses_DistinctOriginDest]
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses]  WITH CHECK ADD  CONSTRAINT [CK_DestinoTerminal_Buses_NombreDistinct] CHECK  (([nombreTerminalOrigen]<>[nombreTerminalDestino]))
GO
ALTER TABLE [dbo].[DestinoTerminal_Buses] CHECK CONSTRAINT [CK_DestinoTerminal_Buses_NombreDistinct]
GO
ALTER TABLE [dbo].[OrigenesDestinos]  WITH CHECK ADD  CONSTRAINT [CK_OrigenesDestinos_DepartamentoDistinct] CHECK  (([idDepartamentoTerminalOrigen]<>[idDepartamentoTerminalDestino]))
GO
ALTER TABLE [dbo].[OrigenesDestinos] CHECK CONSTRAINT [CK_OrigenesDestinos_DepartamentoDistinct]
GO
ALTER TABLE [dbo].[OrigenesDestinos]  WITH CHECK ADD  CONSTRAINT [CK_OrigenesDestinos_DistinctOriginDest] CHECK  (([idOrigen]<>[idDestino]))
GO
ALTER TABLE [dbo].[OrigenesDestinos] CHECK CONSTRAINT [CK_OrigenesDestinos_DistinctOriginDest]
GO
ALTER TABLE [dbo].[OrigenesDestinos]  WITH CHECK ADD  CONSTRAINT [CK_OrigenesDestinos_NombreDistinct] CHECK  (([nombreTerminalOrigen]<>[nombreTerminalDestino]))
GO
ALTER TABLE [dbo].[OrigenesDestinos] CHECK CONSTRAINT [CK_OrigenesDestinos_NombreDistinct]
GO
