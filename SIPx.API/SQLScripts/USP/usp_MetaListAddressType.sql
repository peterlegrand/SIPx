CREATE PROCEDURE usp_MetaListAddressType
AS
SELECT AddressTypes.AddressTypeID, Name FROM AddressTypes JOIN UITermLanguages ON AddressTypes.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY AddressTypes.AddressTypeID
