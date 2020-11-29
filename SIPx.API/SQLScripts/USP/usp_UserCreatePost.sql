CREATE PROCEDURE [dbo].[usp_UserCreatePost] (
	@Salutation nvarchar(50)
, @FirstName nvarchar(50)
, @MiddleName nvarchar(50)
, @LastName nvarchar(50)
, @PersonalTitle nvarchar(50)
, @Suffix nvarchar(50)
, @NickName nvarchar(50)
, @FirstNameLocal nvarchar(50)
, @MiddleNameLocal nvarchar(50)
, @LastNameLocal nvarchar(50)
, @GenderId int
, @Birthdate datetime
, @DefaultOrganizationId int
, @Email nvarchar(256)
, @ModifierCreator  nvarchar(450)	)
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @UserId nvarchar(450);
SELECT @UserId = Id FROM aspnetusers where Email = @Email;

INSERT INTO Persons(
		Salutation 
, FirstName
, MiddleName
, LastName
, PersonalTitle
, Suffix
, NickName
, FirstNameLocal
, MiddleNameLocal
, LastNameLocal
, GenderId
, Birthdate
, DefaultOrganizationId
, UserId
, CreatorId 	
, CreatedDate
, ModifierId	
	, ModifiedDate)
VALUES (
	@Salutation 
, @FirstName
, @MiddleName
, @LastName
, @PersonalTitle
, @Suffix
, @NickName
, @FirstNameLocal
, @MiddleNameLocal
, @LastNameLocal
, @GenderId
, @Birthdate
, @DefaultOrganizationId
, @UserId
, @ModifierCreator 	
, getdate()
, @ModifierCreator 	
	, getdate())



	commit transaction