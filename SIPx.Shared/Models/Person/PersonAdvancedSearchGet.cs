using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonAdvancedSearchPost
    {
        [Key]
        public string UserId { get; set; }
        public string Contains { get; set; }

        public int Age { get; set; }
        public DateTime BirthDate { get; set; }
        public int MainOrganizationId { get; set; }
        public int IsUser { get; set; }
        public string RoleId { get; set; }
        public int OrganizationId { get; set; }
        public int ProjectId { get; set; }
        public int CountryId { get; set; }
        public string ProvinceState { get; set; }
        public string County { get; set; }
        public string City { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationValueId { get; set; }

        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<CountryList> Countries { get; set; }
        public List<ClassificationList> Classifications { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }
    }
}
