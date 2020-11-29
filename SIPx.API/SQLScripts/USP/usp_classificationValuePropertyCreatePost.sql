CREATE PROCEDURE usp_classificationValuePropertyCreatePost (
	@ClassificationValueId int
	, @PropertyId int
	, @PropertyInt int
	, @PropertyBool bit
	, @PropertyDate datetime
	, @PropertyString nvarchar(max)
	, @PropertyValueId int
	, @UserId nvarchar(450)) 
 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @ClassificationID int;
SELECT  @ClassificationID =  ClassificationID  FROM ClassificationValues WHERE ClassificationValueId = @ClassificationValueId ; 
INSERT INTO ClassificationValueProperties (
	ClassificationId 
	, ClassificationValueId
	, PropertyId
	, PropertyBool 
	, PropertyDate
	, PropertyInt
	, PropertyString
	, PropertyValueID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate) 
VALUES (
	@ClassificationId 
	, @ClassificationValueId
	, @PropertyId
	, @PropertyBool 
	, @PropertyDate
	, @PropertyInt
	, @PropertyString
	, @PropertyValueID
	, @UserId  
	, getdate()
	, @UserID
	, getdate())

	--PETER TODO Still type 5

	COMMIT TRANSACTION


