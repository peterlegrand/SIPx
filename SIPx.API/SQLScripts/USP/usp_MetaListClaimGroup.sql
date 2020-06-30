CREATE PROCEDURE [dbo].[usp_MetaListClaimGroup]
AS
SELECT ClaimGroups.ClaimGroupId, Name FROM ClaimGroups JOIN UITermLanguages ON ClaimGroups.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ClaimGroups.ClaimGroupID
