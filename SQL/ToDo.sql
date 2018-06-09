/*** To Do   ***/
/*** www.evolutility.com - (c) 2003-2006 Kakoo, Inc.  ***/

CREATE TABLE EVOL_ToDoPriority (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS
) ON [PRIMARY]
GO

CREATE TABLE  EVOL_ToDo (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Publish] [bit] NOT NULL ,
	[Title] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PriorityID] [int] NOT NULL ,
	[CategoryID] [int] NOT NULL ,
	[Complete] [bit] ,
	[DueDate] [datetime] ,
	[Notes] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS,
	[CreationDate] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE EVOL_ToDoCategory (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/************* Creating Constraints ***************************************/
ALTER TABLE [EVOL_ToDoCategory] WITH NOCHECK ADD 
	CONSTRAINT [PK_EVOL_ToDoCategory] PRIMARY KEY  CLUSTERED 
	([ID])  ON [PRIMARY] 
GO
 

ALTER TABLE [EVOL_ToDoPriority] WITH NOCHECK ADD 
	CONSTRAINT [PK_EVOL_ToDoPriority] PRIMARY KEY  CLUSTERED 
	([ID])  ON [PRIMARY] 
GO

ALTER TABLE [EVOL_ToDo] WITH NOCHECK ADD 
	CONSTRAINT [PK_EVOL_ToDo] PRIMARY KEY  CLUSTERED 
	([ID])  ON [PRIMARY] 
GO

ALTER TABLE [EVOL_ToDoCategory] WITH NOCHECK ADD 
	CONSTRAINT [DF_EVOL_ToDoCategory_Name] DEFAULT ('') FOR [Name]
GO
 

ALTER TABLE [EVOL_ToDoPriority] WITH NOCHECK ADD 
	CONSTRAINT [DF_EVOL_ToDoPriority_Name] DEFAULT ('') FOR [Name],
	CONSTRAINT [DF_EVOL_ToDoPriority_Description] DEFAULT ('') FOR [Description]
GO

ALTER TABLE [EVOL_ToDo] WITH NOCHECK ADD 
	CONSTRAINT [DF_EVOL_ToDoUserID] DEFAULT (1) FOR [UserID],
	CONSTRAINT [DF_EVOL_ToDoPublish] DEFAULT (0) FOR [Publish],
	CONSTRAINT [DF_EVOL_ToDoTitle] DEFAULT ('[Untitled]') FOR [Title],
	CONSTRAINT [DF_EVOL_ToDoPriorityID] DEFAULT (1) FOR [PriorityID],
	CONSTRAINT [DF_EVOL_ToDoCategoryID] DEFAULT (1) FOR [CategoryID],
	CONSTRAINT [DF_EVOL_ToDoComplete] DEFAULT (0) FOR [Complete],
	CONSTRAINT [DF_EVOL_ToDoDuedate] DEFAULT (getdate() + 14) FOR [duedate],
	CONSTRAINT [DF_EVOL_ToDocreationdate] DEFAULT (getdate()) FOR [creationdate]
GO


 CREATE  INDEX [EVOL_ToDoCategoryID] ON [EVOL_ToDo]([CategoryID]) ON [PRIMARY]
GO

 CREATE  INDEX [EVOL_ToDoPublish] ON [EVOL_ToDo]([Publish]) ON [PRIMARY]
GO

 CREATE  INDEX [EVOL_ToDoTitle] ON [EVOL_ToDo]([Title]) ON [PRIMARY]
GO

 

/*** Populates EVOL_ToDoCategory ***/
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('[Unfiled]');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Hobby');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Travel');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Finances');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Family');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Business');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Misc.');
INSERT INTO EVOL_ToDoCategory (Name) VALUES ('Health');


GO

/*** Populates EVOL_ToDoPriority ***/
INSERT INTO EVOL_ToDoPriority (Name, Description) VALUES ('1-ASAP', 'ASAP');
INSERT INTO EVOL_ToDoPriority (Name, Description) VALUES ('2-Urgent', 'Urgent');
INSERT INTO EVOL_ToDoPriority (Name, Description) VALUES ('3-Important', 'Important');
INSERT INTO EVOL_ToDoPriority (Name, Description) VALUES ('4-Secondary', 'Secondary');
INSERT INTO EVOL_ToDoPriority (Name, Description) VALUES ('5-Whenever', 'Whenever');

GO

/*** Populates EVOL_ToDo ***/
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (1, 1, 'Call John Doe', 4, 6, 0, getdate()+15, 'Remind him of our deal', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (1, 1, 'Dentist', 5, 8, 0, getdate()+4, '', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (3, 1, 'Take plane ticket...', 2, 3, 1, getdate()-3, '... for New Year where?', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (3, 1, 'Backup system', 1, 6, 1, getdate()-10, '', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (2, 1, 'Update Kakoo', 3, 6, 1, getdate()+4, 'w/ new controls', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (1, 1, 'email Jim', 1, 4, 1, getdate(), '', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (1, 1, 'Car smog check', 1, 1, 0, getdate()-12, '', getdate());
INSERT INTO EVOL_ToDo (UserID, Publish, Title, PriorityID, CategoryID, Complete, duedate, Notes, creationdate)
 VALUES (1, 1, 'Acupuncture  ', 4, 8, 0, getdate()+25, '', getdate());

GO

