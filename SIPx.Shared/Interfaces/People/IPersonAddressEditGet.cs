using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IPersonAddressEditGet
    {
        string Address1 { get; set; }
        string Address2 { get; set; }
        int AddressTypeId { get; set; }
        List<AddressTypeList> AddressTypes { get; set; }
        string AttnName { get; set; }
        string City { get; set; }
        List<CountryList> Countries { get; set; }
        int CountryId { get; set; }
        string County { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string HouseNumber { get; set; }
        string HouseNumberExt { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        int PersonAddressId { get; set; }
        int PersonId { get; set; }
        string PostalCode { get; set; }
        string PostalCodeExt { get; set; }
        string ProvinceState { get; set; }
    }
}