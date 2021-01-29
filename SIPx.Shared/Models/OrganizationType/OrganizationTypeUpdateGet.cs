using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationTypeUpdateGet 
    {
        [Key]
        public int OrganizationTypeId { get; set; }
        public string CodePrefix { get; set; }
        public string CodeSuffix { get; set; }
        public int CodeTypeId { get; set; }
        public int OrganizationTypeLanguageId { get; set; }
        public bool Internal { get; set; }
        public bool LegalEntity { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public List<IconList> Icons { get; set; }
        public List<CodeTypeList> CodeTypes { get; set; }

    }
}
