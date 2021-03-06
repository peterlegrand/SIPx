﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonPositionUpdateGet
    {
        [Key]
        public int OrganizationPersonId { get; set; }
        public int OrganizationId { get; set; }
        public int PositionId { get; set; }
        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<OrganizationList> Organizations { get; set; }
        public List<PositionList> Positions { get; set; }
    }
}
