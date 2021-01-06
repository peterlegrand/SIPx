using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationPositionCreateGet
    {
        [Key]
        public int OrganizationId { get; set; }
        public int PersonId { get; set; }
        public int PositionId { get; set; }
        public string UserId { get; set; }
        public List<PersonList> Persons { get; set; }
        public List<PositionList> Positions { get; set; }
    }
}
