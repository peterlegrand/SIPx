CREATE PROCEDURE [dbo].[usp_MetaListTelecomType]
AS
SELECT TelecomTypes.TelecomTypeID, Name FROM TelecomTypes JOIN UITermLanguages ON TelecomTypes.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY TelecomTypes.TelecomTypeID



