using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class PersonAddress
    {
        [Key]
        public int PersonAddressID { get; set; }
        public string AddressTypeName { get; set; }
        public string AttnName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string HouseNumber { get; set; }
        public string HouseNumberExt { get; set; }
        public string Location { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string PostalCodeExt { get; set; }
        public string CountryName { get; set; }
        public string ProcinceState { get; set; }
        public string County { get; set; }
        public int StatusName { get; set; }
        public string SubRegionName { get; set; }
        public int RegionID { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionID { get; set; }
        public string IntermediateRegionName { get; set; }

    }
}
