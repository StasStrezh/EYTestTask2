
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/12/2019 20:24:45
-- Generated from EDMX file: C:\Users\User\source\repos\EYTask2\EYTask2\Models\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TestDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------
IF OBJECT_ID(N'[dbo].[FK_DataFileSheet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sheets] DROP CONSTRAINT [FK_DataFileSheet];
GO
IF OBJECT_ID(N'[dbo].[FK_CirculationSheet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Circulations] DROP CONSTRAINT [FK_CirculationSheet];
GO
IF OBJECT_ID(N'[dbo].[FK_OpeningBalanceSheet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OpeningBalancies] DROP CONSTRAINT [FK_OpeningBalanceSheet];
GO
IF OBJECT_ID(N'[dbo].[FK_ClosingBalanceSheet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ClosingBalancies] DROP CONSTRAINT [FK_ClosingBalanceSheet];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Circulations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Circulations];
GO
IF OBJECT_ID(N'[dbo].[ClosingBalancies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClosingBalancies];
GO
IF OBJECT_ID(N'[dbo].[OpeningBalancies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OpeningBalancies];
GO
IF OBJECT_ID(N'[dbo].[Sheets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sheets];
GO
IF OBJECT_ID(N'[dbo].[DataFiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DataFiles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Circulations'
CREATE TABLE [dbo].[Circulations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Debit] float  NOT NULL,
    [Credit] float  NOT NULL,
    [Sheet_Id] int  NOT NULL,
    [Sheet_FileId] int  NOT NULL
);
GO

-- Creating table 'ClosingBalancies'
CREATE TABLE [dbo].[ClosingBalancies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Asset] float  NOT NULL,
    [Liability] float  NOT NULL,
    [Sheet_Id] int  NOT NULL,
    [Sheet_FileId] int  NOT NULL
);
GO

-- Creating table 'OpeningBalancies'
CREATE TABLE [dbo].[OpeningBalancies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Asset] float  NOT NULL,
    [Liability] float  NOT NULL,
    [Sheet_Id] int  NOT NULL,
    [Sheet_FileId] int  NOT NULL
);
GO

-- Creating table 'Sheets'
CREATE TABLE [dbo].[Sheets] (
    [Id] int  NOT NULL,
    [Class] nvarchar(max)  NULL,
    [FileId] int  NOT NULL
);
GO

-- Creating table 'DataFiles'
CREATE TABLE [dbo].[DataFiles] (
    [Id] int  NOT NULL,
    [FileName] nvarchar(max)  NOT NULL,
    [Uploaded] bit  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Circulations'
ALTER TABLE [dbo].[Circulations]
ADD CONSTRAINT [PK_Circulations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClosingBalancies'
ALTER TABLE [dbo].[ClosingBalancies]
ADD CONSTRAINT [PK_ClosingBalancies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OpeningBalancies'
ALTER TABLE [dbo].[OpeningBalancies]
ADD CONSTRAINT [PK_OpeningBalancies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [FileId] in table 'Sheets'
ALTER TABLE [dbo].[Sheets]
ADD CONSTRAINT [PK_Sheets]
    PRIMARY KEY CLUSTERED ([Id], [FileId] ASC);
GO

-- Creating primary key on [Id] in table 'DataFiles'
ALTER TABLE [dbo].[DataFiles]
ADD CONSTRAINT [PK_DataFiles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Sheet_Id], [Sheet_FileId] in table 'Circulations'
ALTER TABLE [dbo].[Circulations]
ADD CONSTRAINT [FK_CirculationSheet]
    FOREIGN KEY ([Sheet_Id], [Sheet_FileId])
    REFERENCES [dbo].[Sheets]
        ([Id], [FileId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CirculationSheet'
CREATE INDEX [IX_FK_CirculationSheet]
ON [dbo].[Circulations]
    ([Sheet_Id], [Sheet_FileId]);
GO

-- Creating foreign key on [Sheet_Id], [Sheet_FileId] in table 'ClosingBalancies'
ALTER TABLE [dbo].[ClosingBalancies]
ADD CONSTRAINT [FK_ClosingBalanceSheet]
    FOREIGN KEY ([Sheet_Id], [Sheet_FileId])
    REFERENCES [dbo].[Sheets]
        ([Id], [FileId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClosingBalanceSheet'
CREATE INDEX [IX_FK_ClosingBalanceSheet]
ON [dbo].[ClosingBalancies]
    ([Sheet_Id], [Sheet_FileId]);
GO

-- Creating foreign key on [Sheet_Id], [Sheet_FileId] in table 'OpeningBalancies'
ALTER TABLE [dbo].[OpeningBalancies]
ADD CONSTRAINT [FK_OpeningBalanceSheet]
    FOREIGN KEY ([Sheet_Id], [Sheet_FileId])
    REFERENCES [dbo].[Sheets]
        ([Id], [FileId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OpeningBalanceSheet'
CREATE INDEX [IX_FK_OpeningBalanceSheet]
ON [dbo].[OpeningBalancies]
    ([Sheet_Id], [Sheet_FileId]);
GO

-- Creating foreign key on [FileId] in table 'Sheets'
ALTER TABLE [dbo].[Sheets]
ADD CONSTRAINT [FK_DataFileSheet]
    FOREIGN KEY ([FileId])
    REFERENCES [dbo].[DataFiles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DataFileSheet'
CREATE INDEX [IX_FK_DataFileSheet]
ON [dbo].[Sheets]
    ([FileId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------