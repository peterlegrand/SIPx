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
        public int OrganizationName { get; set; }
        public int AddressTypeId { get; set; }
        public string AddressTypeName { get; set; }
        public string AttnName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string HouseNumber { get; set; }
        public string HouseNumberExt { get; set; }
        //public string Location { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string PostalCodeExt { get; set; }
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public string ProcinceState { get; set; }
        public string County { get; set; }
        public int SubRegionId { get; set; }
        public string SubRegionName { get; set; }
        public int RegionId { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionId { get; set; }
        public string IntermediateRegionName { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
