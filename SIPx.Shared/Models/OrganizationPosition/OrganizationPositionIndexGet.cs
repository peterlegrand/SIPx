using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class OrganizationPositionIndexGet
    {
        [Key]
        public int OrganizationPersonId { get; set; }
        public int OrganizationId { get; set; }
        public int PersonId { get; set; }
        public int PositionId { get; set; }
        public string OrganizationName { get; set; }
        public string PositionName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool InternalOrganizationNormalUserCannotDelete { get; set; }

    }
}
