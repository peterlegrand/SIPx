CREATE PROCEDURE [dbo].[usp_MetaListClaimGroup]
AS
SELECT ClaimGroups.ClaimGroupID, Name FROM ClaimGroups JOIN UITermLanguages ON ClaimGroups.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY ClaimGroups.ClaimGroupID
GO


