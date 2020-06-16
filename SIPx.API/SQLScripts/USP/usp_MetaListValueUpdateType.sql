CREATE PROCEDURE [dbo].[usp_MetaListValueUpdateType]
AS
SELECT ValueUpdateTypes.ValueUpdateTypeID, Name FROM ValueUpdateTypes JOIN UITermLanguages ON ValueUpdateTypes.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY ValueUpdateTypes.ValueUpdateTypeID



