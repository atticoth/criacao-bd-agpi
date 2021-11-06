-------------------------------------------------------------------------------------------
--CRIAÇÃO DO BANCO DE DADOS E SUAS TABELAS

CREATE DATABASE DB_AGPI
USE DB_AGPI

-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tbl_LoginUser](
	[CodID] [int] IDENTITY(1,1) NOT NULL,
	[User] [varchar](50) NOT NULL,
	[NameUser] [varchar](max) NOT NULL,
	[Senha] [varchar](max) NOT NULL,
	[Cod_Perfil_Fk] [int] NOT NULL,
	[Inativo] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_LoginUser] PRIMARY KEY CLUSTERED 
(
	[CodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_LoginUser]  WITH CHECK ADD  CONSTRAINT [FK_LoginUser_Perfil] FOREIGN KEY([Cod_Perfil_Fk])
REFERENCES [dbo].[tbl_Perfil] ([CodID])
GO

ALTER TABLE [dbo].[tbl_LoginUser] CHECK CONSTRAINT [FK_LoginUser_Perfil]
GO

-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tbl_Perfil](
	[CodID] [int] IDENTITY(1,1) NOT NULL,
	[Perfil] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Perfil] PRIMARY KEY CLUSTERED 
(
	[CodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tbl_Paciente](
	[CodPacien] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[RG] [varchar](50) NOT NULL,
	[CPF] [varchar](50) NOT NULL,
	[Endereco] [varchar](50) NOT NULL,
	[Convenio] [varchar](50) NOT NULL,
	[Cod_Perfil_Fk] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Paciente] PRIMARY KEY CLUSTERED 
(
	[CodPacien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Perfil] FOREIGN KEY([Cod_Perfil_Fk])
REFERENCES [dbo].[tbl_Perfil] ([CodID])
GO

ALTER TABLE [dbo].[tbl_Paciente] CHECK CONSTRAINT [FK_Paciente_Perfil]
GO

-------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[tbl_Funcionarios](
	[CodFunc] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[CargaHoraria] [varchar](50) NOT NULL,
	[Unidade] [varchar](50) NOT NULL,
	[Setor] [varchar](50) NOT NULL,
	[Cod_Perfil_FK] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Funcionarios] PRIMARY KEY CLUSTERED 
(
	[CodFunc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_Funcionarios_Perfil] FOREIGN KEY([Cod_Perfil_FK])
REFERENCES [dbo].[tbl_Perfil] ([CodID])
GO

ALTER TABLE [dbo].[tbl_Funcionarios] CHECK CONSTRAINT [FK_Funcionarios_Perfil]
GO

-------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[tbl_Consulta](
	[CodAtend] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Pacien_FK] [int] NOT NULL,
	[Cod_Func_FK] [int] NOT NULL,
	[Peso] [float] NOT NULL,
	[Altura] [float] NOT NULL,
	[Pressao] [varchar](7) NOT NULL,
	[Temperatura] [float] NOT NULL,
	[Diagnóstico] [varchar](max) NOT NULL,
	[Histórico] [varchar](max) NOT NULL,
	[Receita] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_Consulta] PRIMARY KEY CLUSTERED 
(
	[CodAtend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Funcionarios] FOREIGN KEY([Cod_Func_FK])
REFERENCES [dbo].[tbl_Funcionarios] ([CodFunc])
GO

ALTER TABLE [dbo].[tbl_Consulta] CHECK CONSTRAINT [FK_Consulta_Funcionarios]
GO

ALTER TABLE [dbo].[tbl_Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Paciente] FOREIGN KEY([Cod_Pacien_FK])
REFERENCES [dbo].[tbl_Paciente] ([CodPacien])
GO

ALTER TABLE [dbo].[tbl_Consulta] CHECK CONSTRAINT [FK_Consulta_Paciente]
GO