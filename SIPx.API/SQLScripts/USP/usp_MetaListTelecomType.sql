CREATE PROCEDURE [dbo].[usp_MetaListTelecomType]
AS
SELECT TelecomTypes.TelecomTypeId, Name FROM TelecomTypes JOIN UITermLanguages ON TelecomTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY TelecomTypes.TelecomTypeID



