using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonAddressCreatePost : IPersonAddressCreatePost
    {
        [Key]
        public int PersonID { get; set; }
        public int AddressTypeID { get; set; }
        public string AttnName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string HouseNumber { get; set; }
        public string HouseNumberExt { get; set; }
        public string Location { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string PostalCodeExt { get; set; }
        public int CountryID { get; set; }
        public string ProvinceState { get; set; }
        public string County { get; set; }
        public string UserId { get; set; }

    }
}
