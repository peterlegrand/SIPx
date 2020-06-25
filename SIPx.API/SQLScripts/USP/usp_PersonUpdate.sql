CREATE PROCEDURE [dbo].[usp_PersonUpdate] (
	@PersonID int
	, @Salutation nvarchar(50)
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
UPDATE Persons SET
	Salutation = @Salutation 
	, FirstName = @FirstName
	, MiddleName = @MiddleName
	, LastName = @LastName 
	, PersonalTitle =@PersonalTitle 
	, Suffix = @Suffix 
	, NickName = @NickName 
	, FirstNameLocal = @FirstNameLocal 
	, MiddleNameLocal = @MiddleNameLocal 
	, LastNameLocal = @LastNameLocal 
	, GenderID = @GenderID 
	, Birthdate = @Birthdate 
	, DeceasedDate = @DeceasedDate 
	, DefaultOrganizationID = @DefaultOrganizationID 
	, UserID = @UserID 
	, ModifierID = @ModifierCreator
	, ModifiedDate = Getdate()
