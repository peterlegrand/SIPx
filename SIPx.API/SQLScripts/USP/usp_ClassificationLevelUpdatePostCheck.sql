CREATE PROCEDURE usp_ClassificationLevelUpdatePostCheck (
	@ClassificationLevelId int
	, @Sequence int
	, @DateLevelId int
	, @OnTheFly bit
	, @Alphabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ClassificationId int;
SELECT @ClassificationId = ClassificationId FROM Classificationlevels WHERE ClassificationLevelId = @ClassificationLevelId;
BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF @Name ='' OR @Name IS NULL
BEGIN
insert into @ErrorIdsTable values(104)
END

IF @Description ='' 
BEGIN
insert into @ErrorIdsTable values(9)
END

IF @MenuName ='' 
BEGIN
insert into @ErrorIdsTable values(10)
END

IF @MouseOver ='' 
BEGIN
insert into @ErrorIdsTable values(11)
END

IF (SELECT COUNT(*) FROM ClassificationLevels WHERE ClassificationLevelID = @ClassificationLevelId) = 0
BEGIN
insert into @ErrorIdsTable values(21)
END

--PETER this should not be updated as properties will be assigned to new values.
--IF (SELECT MAX(Sequence) 
--	FROM ClassificationLevels WHERE ClassificationID = @ClassificationId ) < @Sequence + 1
--BEGIN
--	insert into @ErrorIdsTable values(13)
--END


IF  @DateLevelId NOT IN (1,2,3,4,5) 
BEGIN
insert into @ErrorIdsTable values(14)
END
	
IF @OnTheFly NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(15)
END
	
IF @Alphabetically NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(16)
END
	
IF @CanLink NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(17)
END
	
IF @InDropDown NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(18)
END

	
IF @InMenu NOT IN (0,1) 
BEGIN
insert into @ErrorIdsTable values(19)
END


IF  (SELECT COUNT(*) 
	FROM ClassificationLevelLanguages 
	WHERE LanguageId = @LanguageID 
		AND ClassificationId = @ClassificationId AND Name = @Name AND ClassificationLevelID <> @ClassificationLevelId) >0
BEGIN
	insert into @ErrorIdsTable values(20)
END


SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END