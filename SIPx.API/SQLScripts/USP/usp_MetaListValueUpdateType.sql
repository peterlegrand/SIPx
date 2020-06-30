CREATE PROCEDURE [dbo].[usp_MetaListValueUpdateType]
AS
SELECT ValueUpdateTypes.ValueUpdateTypeId, Name FROM ValueUpdateTypes JOIN UITermLanguages ON ValueUpdateTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ValueUpdateTypes.ValueUpdateTypeID



