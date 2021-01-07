using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonPositionCreateGet
    {
        [Key]
        public int OrganizationId { get; set; }
        public int PersonId { get; set; }
        public int PositionId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserId { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<PositionList> Positions { get; set; }
    }
}
