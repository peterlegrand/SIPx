CREATE PROCEDURE usp_UserMenuTemplateOptionUpdatePost(
	@UserMenuTemplateOptionID int
, 	@IconId int
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @UserMenuTypeIDLeft int
	, @UserMenuTypeIDRight int
	, @Sequence int
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

SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM UserMenuTemplateOptions  WHERE @UserMenuTemplateOptionID= @UserMenuTemplateOptionID;

IF @OldSequence > @Sequence
BEGIN
UPDATE UserMenuTemplateOptions SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE UserMenuTemplateOptions SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END



UPDATE UserMenuTemplateOptions 
SET UserMenuTypeIDLeft = @UserMenuTypeIDLeft
	, UserMenuTypeIDRight = @UserMenuTypeIDRight
	, UserPageIdLeft = @UserPageIdLeft
	, UserPageIdRight = @UserPageIdRight
	, IconId = @IconId
	, Sequence = @Sequence
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE UserMenuTemplateOptionID = @UserMenuTemplateOptionID

UPDATE UserMenuTemplateOptionLanguages 
SET Name = @Name
	, Description= @Description
	, MenuName= @MenuName
	, MouseOver = @MouseOver 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE UserMenuTemplateOptionId = @UserMenuTemplateOptionID
	AND LanguageId = @LanguageId


COMMIT TRANSACTION