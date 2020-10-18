CREATE PROCEDURE usp_UserUpdatePost (
	@PersonId int
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
	, @GenderId int
	, @BirthDate datetime
	, @DefaultOrganizationId int
	, @USerModifierId nvarchar(450)
	 )
AS
UPDATE Persons
SET Salutation = @Salutation 
	, FirstName = @FirstName 
	, MiddleName = @MiddleName 
	, LastName = @LastName 
	, PersonalTitle = @PersonalTitle 
	, Suffix = @Suffix 
	, NickName = @NickName 
	, FirstNameLocal = @FirstNameLocal 
	, MiddleNameLocal = @MiddleNameLocal 
	, LastNameLocal = @LastNameLocal 
	, GenderId = @GenderId 
	, BirthDate = @BirthDate 
	, DefaultOrganizationId = @DefaultOrganizationId 
	, ModifierId = @USerModifierId
	, ModifiedDate = getdate()
WHERE PersonId = @PersonId 