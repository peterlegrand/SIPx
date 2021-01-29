using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixDeleteGet
    {
        [Key]
        public int ProjectTypeMatrixId { get; set; }
        public int FromProjectTypeId { get; set; }
        public int ToProjectTypeId { get; set; }
        public int ProjectMatrixTypeId { get; set; }
        public string FromProjectTypeName { get; set; }
        public string ToProjectTypeName { get; set; }
        public string ProjectMatrixTypeName { get; set; }
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
        public bool IsFrom { get; set; }
        public string UserId { get; set; }
    }
}
