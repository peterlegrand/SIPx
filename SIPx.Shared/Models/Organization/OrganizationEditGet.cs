using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationEditGet : IOrganizationEditGet
    {
        [Key]
        public int OrganizationId { get; set; }
        public int OrganizationLanguageId { get; set; }
        public int? ParentOrganizationId { get; set; }
        public int StatusId { get; set; }
        public int OrganizationTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<OrganizationList> Organizations { get; set; }
        public List<StatusList> Statuses { get; set; }
        public List<OrganizationTypeList> OrganizationTypes { get; set; }
    }
}
