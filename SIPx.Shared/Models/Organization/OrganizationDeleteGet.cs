using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationDeleteGet
    {
        [Key]
        public int OrganizationId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public string ParentOrganizationName { get; set; }
        public string StatusName { get; set; }
        public string OrganizationTypeName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
    }
}
