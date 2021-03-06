﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationDeleteGet
    {
        [Key]
        public int PersonRelationId { get; set; }
        public int PersonId { get; set; }
        public string FromPersonFirstName { get; set; }
        public string FromPersonLastName { get; set; }
        public string FromOrganizationName { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime? ValidTill { get; set; }
        public string PersonRelationTypeName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
    }
}
