using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationIndexeGet 
    {
        [Key]
        public int PersonRelationId { get; set; }
        public int FromPersonFirstId { get; set; }
        public string FromPersonFirstName { get; set; }
        public string FromPersonLastName { get; set; }
        public string FromOrganizationName { get; set; }
        public int ToPersonFirstId { get; set; }
        public string ToPersonFirstName { get; set; }
        public string ToPersonLastName { get; set; }
        public string ToOrganizationName { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime? ValidTill { get; set; }
        public string PersonRelationTypeId { get; set; }
        public string PersonRelationTypeName { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
