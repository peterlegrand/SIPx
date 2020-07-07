using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class OrganizationAddressIndexGet
    {
        [Key]
        public int OrganizationAddressId { get; set; }
        public int OrganizationId { get; set; }
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
        public int RegionId { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionId { get; set; }
        public string IntermediateRegionName { get; set; }

    }
}
