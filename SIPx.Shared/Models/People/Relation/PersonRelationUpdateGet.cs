using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationUpdateGet 
    {
        [Key]
        public int PersonRelationId { get; set; }
        public string FromPersonFirstName { get; set; }
        public string FromPersonLastName { get; set; }
        public string FromOrganizationName { get; set; }
        public int FromPersonId { get; set; }
        public int ToPersonId { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime? ValidTill { get; set; }
        public int PersonRelationTypeId { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<PersonRelationTypeList> PersonRelationTypes { get; set; }
        public List<PersonList> Persons { get; set; }
    }
}
