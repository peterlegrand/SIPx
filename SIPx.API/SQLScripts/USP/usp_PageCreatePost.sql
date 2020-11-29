CREATE PROCEDURE usp_PageCreatePost (
	@ShowTitleName bit
	, @ShowTitleDescription bit
	, @StatusId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)
	, @OrganizationId int
	, @ProjectId int
	, @ClassificationId int
	, @SelectedUserId nvarchar(450))
AS

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @OrganizationString1 varchar(50);
DECLARE @OrganizationString2 varchar(50);
SET @OrganizationString1 ='';
SET @OrganizationString2 ='';
IF @OrganizationId <> 0
BEGIN 
SET @OrganizationString1 = ' , OrganizationId ';
SET @OrganizationString2 = ' , '+ CAST(@OrganizationId as varchar(10));
END

DECLARE @ProjectString1 varchar(50);
DECLARE @ProjectString2 varchar(50);
SET @ProjectString1 ='';
SET @ProjectString2 ='';
IF @ProjectId <> 0
BEGIN 
SET @ProjectString1 = ' , ProjectId ';
SET @ProjectString2 = ' , '+ CAST(@ProjectId as varchar(10));
END

DECLARE @ClassificationString1 varchar(50);
DECLARE @ClassificationString2 varchar(50);
SET @ClassificationString1 ='';
SET @ClassificationString2 ='';
IF @ClassificationId <> 0
BEGIN 
SET @ClassificationString1 = ' , ClassificationId ';
SET @ClassificationString2 = ' , '+ CAST(@ClassificationId as varchar(10));
END

DECLARE @UserString1 varchar(50);
DECLARE @UserString2 varchar(550);
SET @UserString1 ='';
SET @UserString2 ='';
IF @SelectedUserId <> ''
BEGIN 
SET @UserString1 = ' , UserId ';
SET @UserString2 = ' , '''+ @SelectedUserId + '''' ;
END



BEGIN
DECLARE @statement NVARCHAR(2200);
SET @statement =  'BEGIN TRANSACTION; INSERT INTO Pages ( ShowTitleName, ShowTitleDescription, StatusId, CreatorID, CreatedDate, ModifierID, ModifiedDate ' 
+ @OrganizationString1 + @ProjectString1 + @ClassificationString1 + @UserString1 + ') VALUES ( ' + 
	 +  CAST(@ShowTitleName as varchar(1)) +
	+ ', ' +  CAST(@ShowTitleDescription as varchar(1)) +
	+ ', ' +  CAST(@StatusId as varchar(2)) +
	+ ', ''' +  @UserID +
	+ ''', ''' +  CAST(getdate() as varchar(20)) +
	+ ''', ''' +  @UserID +
	+ ''', ''' +  CAST(getdate() as varchar(20)) +''''+ 
	+ @OrganizationString2
	+ @ProjectString2
	+ @ClassificationString2
	+ @UserString2
	+ ');'

	+ 'DECLARE @NewPageId int	= scope_identity();'

	+ 'INSERT INTO PageLanguages ('
		+ 'PageID'
		+ ', LanguageID'
		+ ', Name'
		+ ', Description'
		+ ', MenuName'
		+ ', MouseOver'
		+ ', TitleName'
		+ ', TitleDescription'
		+ ', CreatorID'
		+ ', CreatedDate'
		+ ', ModifierID'
		+ ', ModifiedDate)'
+ 'VALUES ( @NewPageId '
	+ ', '  + CAST(@LanguageID as varchar(10))
	+ ', '''  + @Name
	+ ''', '''  + @Description
	+ ''', '''  + @MenuName
	+ ''', '''  + @MouseOver
	+ ''', '''  + @TitleName
	+ ''', '''  + @TitleDescription
	+ ''', '''  + @UserID
	+ ''', '''  + CAST(getdate()  as varchar(20))
	+ ''', '''  + @UserID
	+ ''', '''  + CAST(getdate()  as varchar(20))
	+''');'
	+' COMMIT TRANSACTION;'



EXECUTE sp_executesql @statement
END
	