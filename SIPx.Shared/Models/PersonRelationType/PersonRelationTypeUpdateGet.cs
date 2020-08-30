using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationTypeUpdateGet 
    {
        [Key]
        public int PersonRelationTypeId { get; set; }
        public int PersonRelationTypeLanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string FromIsAnXOfTo { get; set; }
        public string ToIsAnXOfFrom { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public bool SeePersonal { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<IconList> Icons { get; set; }
    }
}
