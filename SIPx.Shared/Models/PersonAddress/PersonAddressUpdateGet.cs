using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonAddressUpdateGet 
    {
        [Key]
        public int PersonAddressId { get; set; }
        public int PersonId { get; set; }
        public int AddressTypeId { get; set; }
        public string AttnName { get; set; } = "";
        public string Address1 { get; set; } = "";
        public string Address2 { get; set; } = "";
        public string HouseNumber { get; set; } = "";
        public string HouseNumberExt { get; set; } = "";
        public string City { get; set; } = "";
        public string PostalCode { get; set; } = "";
        public string PostalCodeExt { get; set; } = "";
        public int CountryId { get; set; }
        public string ProvinceState { get; set; } = "";
        public string County { get; set; } = "";
        public string CreatorName { get; set; } = "";
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<CountryList> Countries { get; set; }
        public List<AddressTypeList> AddressTypes { get; set; }
    }
}
