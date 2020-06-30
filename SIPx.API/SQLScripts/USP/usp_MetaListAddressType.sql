CREATE PROCEDURE usp_MetaListAddressType
AS
SELECT AddressTypes.AddressTypeId, Name FROM AddressTypes JOIN UITermLanguages ON AddressTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY AddressTypes.AddressTypeID
