DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT RoleGroups ON;
INSERT INTO RoleGroups (RoleGroupID, Sequence, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES(1,1,@User,@User,getdate(),getdate());
SET IDENTITY_INSERT RoleGroups OFF;

SET IDENTITY_INSERT RoleGroupLanguages ON;
INSERT INTO RoleGroupLanguages (RoleGroupLanguageID, RoleGroupID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) 
VALUES(1,1,41,'Admin','Admin','Admin','Admin',@User,@User,getdate(),getdate());
SET IDENTITY_INSERT RoleGroupLanguages OFF;

SET IDENTITY_INSERT Genders ON;
INSERT INTO Genders (GenderId, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID, Active, ModifierID, ModifiedDate) VALUES 
(1,1753,1753,1753,1753,1,@User,getdate())
, (2,1754,1754,1754,1754,1,@User,getdate())
, (3,1755,1755,1755,1755,0,@User,getdate())

SET IDENTITY_INSERT Genders OFF;
