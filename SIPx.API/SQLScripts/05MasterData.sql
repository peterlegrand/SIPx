DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT RoleGroups ON;
INSERT INTO RoleGroups (RoleGroupId, Sequence, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES(1,1,@User,@User,getdate(),getdate());
SET IDENTITY_INSERT RoleGroups OFF;

