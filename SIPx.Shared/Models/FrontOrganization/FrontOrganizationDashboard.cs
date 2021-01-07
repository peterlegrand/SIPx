using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontOrganizationDashboard
    {
        [Key]
        public int OrganizationId { get; set; }
        public int? ParentOrganizationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ParentOrganizationName { get; set; }
        public string StatusName { get; set; }
        public int OrganizationTypeId { get; set; }
        public string OrganizationTypeName { get; set; }
        public int SecurityLevelId { get; set; }
        public string SecurityLevelName { get; set; }
        public bool CanEdit { get; set; }
        public bool CanCreate { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<FrontOrganizationDashboardAddress> Addresses { get; set; }
        public List<FrontOrganizationDashboardTelecom> Telecoms { get; set; }

        public List<FrontOrganizationDashboardSubOrganization> SubOrganizations { get; set; }
        public List<FrontOrganizationDashboardPersonRole> PersonRoles { get; set; }
        public List<FrontOrganizationDashboardPersonPosition> PersonPositions { get; set; }
        public List<FrontOrganizationDashboardContent> Contents { get; set; }
        public List<FrontOrganizationDashboardProcess> Processes { get; set; }
        public JObject SubOrganizationTree { get; set; }
    }
}
