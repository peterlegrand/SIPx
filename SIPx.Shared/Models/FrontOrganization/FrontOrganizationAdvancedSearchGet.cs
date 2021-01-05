using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontOrganizationAdvancedSearchGet
    {
        public string UserId { get; set; }
        public string Contains { get; set; }
        public string OrganizationName { get; set; }
        public int ParentOrganizationId { get; set; }
        public int PersonId{ get; set; }
        public string OrganizationParentName { get; set; }
        public int StatusId { get; set; }
        public string OrganizationStatusName { get; set; }
        public int OrganizationTypeId { get; set; }
        public string OrganizationTypeName { get; set; }
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public string OrganizationProvinceState { get; set; }
        public string OrganizationCity { get; set; }
        public int LegalEntity { get; set; }
        public int Internal { get; set; }
        public int IAmMemberOfOrganization { get; set; }
        public List<OrganizationList> ParentOrganizations { get; set; }
        public List<StatusList> Statuses { get; set; }
        public List<OrganizationTypeList> OrganizationTypes { get; set; }
        public List<CountryList> Countries { get; set; }
        public List<OrganizationList> SearchResult { get; set; }
    }
}
