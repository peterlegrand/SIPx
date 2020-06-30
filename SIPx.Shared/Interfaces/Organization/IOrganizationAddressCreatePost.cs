namespace SIPx.Shared
{
    public interface IOrganizationAddressCreatePost
    {
        string Address1 { get; set; }
        string Address2 { get; set; }
        int AddressTypeId { get; set; }
        string AttnName { get; set; }
        string City { get; set; }
        int CountryId { get; set; }
        string County { get; set; }
        string HouseNumber { get; set; }
        string HouseNumberExt { get; set; }
        string Location { get; set; }
        int OrganizationId { get; set; }
        string PostalCode { get; set; }
        string PostalCodeExt { get; set; }
        string ProvinceState { get; set; }
        string UserId { get; set; }
    }
}