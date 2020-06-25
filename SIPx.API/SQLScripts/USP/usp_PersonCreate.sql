CREATE PROCEDURE [dbo].[usp_PersonCreate] (
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
	, @GenderID int
	, @Birthdate DateTime
	, @DeceasedDate DateTime
	, @DefaultOrganizationID int
	, @UserID nvarchar(450)
	, @ModifierCreator nvarchar(450)) 
AS 
INSERT INTO Persons (
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
	, GenderID 
	, Birthdate 
	, DeceasedDate 
	, DefaultOrganizationID 
	, UserID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate
	)
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
	, @GenderID 
	, @Birthdate 
	, @DeceasedDate 
	, @DefaultOrganizationID 
	, @UserID 
	, @ModifierCreator 
	, getdate()
	, @ModifierCreator 
	, getdate())

