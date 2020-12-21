using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationForPanel
    {
        [Key]
        public int OrganizationId { get; set; }
        public int OrganizationTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string OrganizationTypeName { get; set; }
        public string StatusName { get; set; }
        public bool Internal { get; set; }
        public bool LegalEntity { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public String ControlId { get; set; }
        public string UserId { get; set; }

    }
}
