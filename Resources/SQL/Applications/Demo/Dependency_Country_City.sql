/* (c) 2012 Olivier Giulieri - www.evolutility.org  */
/*
	This file is part of Evolutility CRUD Framework.
	Source link <http://www.evolutility.org/download/download.aspx>

	Evolutility is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Evolutility is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Affero  License for more details.

	You should have received a copy of the GNU Affero License
	along with Evolutility. If not, see <http://www.gnu.org/licenses/>.
*/


CREATE TABLE [dep_Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[icon] [nvarchar](50) NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dep_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) 
) ON [PRIMARY]

GO

CREATE TABLE [dep_City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NULL,
 CONSTRAINT [PK_dep_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) 
) ON [PRIMARY]

GO

CREATE TABLE [dep_Place](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[web] [nvarchar](300) NULL,
	[CountryID] [int] NOT NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_dep_Place] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) 
) ON [PRIMARY]

GO 

INSERT INTO dep_Country (icon, name)
  VALUES ('us.gif', 'United States');
INSERT INTO dep_Country (icon, name)
  VALUES ('fr.gif', 'France');
INSERT INTO dep_Country (icon, name)
  VALUES ('jp.gif', 'Japan');
INSERT INTO dep_Country (icon, name)
  VALUES ('es.gif', 'Spain');
INSERT INTO dep_Country (icon, name)
  VALUES ('pt.gif', 'Portugal');
 

INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('New York', 1, 2);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('San Francisco', 1, 1);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('San Mateo', 1, 1);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Los Angeles', 1, 1);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Paris', 2, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Nice', 2, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Tokyo', 3, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Osaka', 3, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Barcelona', 4, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Madrid', 4, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Lisbon', 5, 0);
INSERT INTO dep_City (name, CountryID, StateID)
  VALUES ('Oporto', 5, 0);
 

INSERT INTO dep_Place (name, Description, web, CountryID, CityID)
  VALUES ('Place New York', '', '', 1, 2);
INSERT INTO dep_Place (name, Description, web, CountryID, CityID)
  VALUES ('Evolutility', '', 'http://www.evolutility.org', 1, 3);
INSERT INTO dep_Place (name, Description, web, CountryID, CityID)
  VALUES ('Place San Mateo', '', '', 1, 3);
INSERT INTO dep_Place (name, Description, web, CountryID, CityID)
  VALUES ('Place Nice', '', '', 2, 6);
INSERT INTO dep_Place (name, Description, web, CountryID, CityID)
  VALUES ('Place Tokyo', '', '', 3, 7);
INSERT INTO dep_Place (name, Description, web, CountryID, CityID)
  VALUES ('Place Barcelona', '', '', 4, 9);


