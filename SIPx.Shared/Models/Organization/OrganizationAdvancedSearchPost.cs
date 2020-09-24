using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationAdvancedSearchPost
    {
        [Key]
        public string UserId { get; set; }
        public string Contains { get; set; }
        public int ParentOrganizationId { get; set; }
        public int OrganizationTypeId { get; set; }
        public int StatusId { get; set; }
        public int PersonId { get; set; }


        public List<OrganizationList> ParentOrganizations { get; set; }
        public List<OrganizationTypeList> OrganizationTypes { get; set; }
        public List<StatusList> Statuses { get; set; }
        public List<PersonList> Persons { get; set; }

    }
}
