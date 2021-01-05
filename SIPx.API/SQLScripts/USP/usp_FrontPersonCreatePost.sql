CREATE PROCEDURE usp_FrontPersonCreatePost (
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
	, @Birthdate DateTime 
	, @DefaultOrganizationId int
	, @UserId nvarchar(450)) 
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
	, GenderId 
	, Birthdate 
	, DefaultOrganizationId 
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
	, @GenderId 
	, @Birthdate 
	, @DefaultOrganizationId 
	, @UserId 
	, getdate()
	, @UserId
	, getdate())

