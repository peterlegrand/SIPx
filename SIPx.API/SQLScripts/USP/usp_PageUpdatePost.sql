CREATE PROCEDURE [dbo].[usp_PageUpdatePost] (
	@PageId int
	, @ShowTitleName bit
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

DECLARE @OrganizationString varchar(50);
SET @OrganizationString ='';
IF @OrganizationId <> 0
BEGIN 
SET @OrganizationString = ' ,  OrganizationId = '+ CAST(@OrganizationId as varchar(10))  ;
END

DECLARE @ProjectString varchar(50);
SET @ProjectString ='';
IF @ProjectId <> 0
BEGIN 
SET @ProjectString = ' ,  ProjectId = '+ CAST(@ProjectId as varchar(10)) ;
END

DECLARE @ClassificationString varchar(50);
SET @ClassificationString ='';
IF @ClassificationId <> 0
BEGIN 
SET @ClassificationString = ' ,  ClassificationId = '+ CAST(@ClassificationId as varchar(10)) ;
END

DECLARE @UserString nvarchar(550);
SET @UserString ='';
IF @UserId <> ''
BEGIN 
SET @UserString = ' ,  UserId = '''+ @SelectedUserId  + ''' ';
END

BEGIN
DECLARE @statement NVARCHAR(2200);
SET @statement =  'BEGIN TRANSACTION; UPDATE Pages SET StatusId = ' + CAST(@StatusID as varchar(10)) 
	+ ', ShowtitleName = ' + CAST(@ShowtitleName as varchar(1)) 
	+ ', ShowtitleDescription = ' + CAST(@ShowtitleDescription as varchar(1))
	+ @OrganizationString
	+ @ProjectString
	+ @ClassificationString
	+ @UserString
	+ ', ModifierId = ''' + @UserID + '''' +
	+ ', ModifiedDate = ''' +CAST(GETDATE() as varchar(20)) +  '''' 
	+ ' WHERE PageId = ' + CAST(@PageID as varchar(10)) + ';'

	+ ' UPDATE PageLanguages SET Name = ''' + @Name + '''' 
	+ ', Description =  ''' + @Description +  '''' 
	+ ', MenuName =  ''' + @MenuName +  '''' 
	+ ', MouseOver =  ''' + @MouseOver +  '''' 
	+ ', TitleName =  ''' + @TitleName +  '''' 
	+ ', TitleDescription =  ''' + @TitleDescription +  '''' 
	+ ', ModifierId =  ''' + @UserID +  '''' 
	+ ', ModifiedDate =  ''' + CAST(GETDATE() as varchar(20)) +  '''' 
	+ ' WHERE PageID= ' + CAST(@PageID as varchar(10)) 
	+ ' AND LanguageID= ' + CAST(@LanguageID as varchar(10)) +';'
	+ ' COMMIT TRANSACTION; '
--	select @statement
EXECUTE sp_executesql @statement
END
