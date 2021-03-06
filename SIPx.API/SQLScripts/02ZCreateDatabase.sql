CREATE FULLTEXT CATALOG ContentCatalog;
CREATE FULLTEXT CATALOG ContentVersionCatalog;
CREATE FULLTEXT CATALOG ProcessCatalog;
CREATE FULLTEXT CATALOG PersonCatalog;
CREATE FULLTEXT CATALOG OrganizationCatalog;
CREATE FULLTEXT CATALOG ProjectCatalog;
CREATE FULLTEXT CATALOG ClassificationCatalog;
CREATE FULLTEXT CATALOG ClassificationValueCatalog;

--ALTER TABLE Contents ADD FullText AS Title + ' ' + Description;
--ALTER TABLE Persons ADD FullText AS FirstName + ' ' + MiddleName + ' ' + LastName + ' ' + NickName + ' ' + FirstNameLocal + ' ' + MiddleNameLocal + ' ' + LastNameLocal  ;
--ALTER TABLE OrganizationLanguages ADD FullText AS Name + ' ' + Description;
--ALTER TABLE ClassificationValueLanguages ADD FullText AS Name + ' ' + Description;
--ALTER TABLE ProjectLanguages ADD FullText AS Name + ' ' + Description;
--ALTER TABLE ClassificationLanguages ADD FullText AS Name + ' ' + Description;

CREATE FULLTEXT INDEX ON contents (Title) KEY INDEX PK_Content ON ContentCatalog;
CREATE FULLTEXT INDEX ON contentVersions (Description) KEY INDEX IX_ContentVersions ON ContentVersionCatalog;
CREATE FULLTEXT INDEX ON ProcessFields (stringValue) KEY INDEX PK_Processfields ON ProcessCatalog;
CREATE FULLTEXT INDEX ON Persons (FullText) KEY INDEX PK_Persons ON PersonCatalog;
CREATE FULLTEXT INDEX ON OrganizationLanguages (FullText) KEY INDEX PK_OrganizationLanguages ON OrganizationCatalog;
CREATE FULLTEXT INDEX ON ProjectLanguages (FullText) KEY INDEX PK_ProjectLanguages ON ProjectCatalog;
CREATE FULLTEXT INDEX ON ClassificationLanguages (FullText) KEY INDEX PK_ClassificationLanguages ON ClassificationCatalog;
CREATE FULLTEXT INDEX ON ClassificationValueLanguages (FullText) KEY INDEX PK_ClassificationValueLanguages ON ClassificationValueCatalog;