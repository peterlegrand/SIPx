using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationIndexGet 
    {
        [Key]
        public int PersonRelationId { get; set; }
        public int FromTo { get; set; }

        public string PersonFirstName { get; set; }
        public string PersonLastName { get; set; }
        public string OrganizationName { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime? ValidTill { get; set; }
        public string PersonRelationTypeId { get; set; }
        public string PersonRelationTypeName { get; set; }
        public string IsOfLabel { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
