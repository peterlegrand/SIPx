using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRoleUpdateGet 
    {
        [Key]
        public int ClassificationRoleId { get; set; }
        public string RoleId { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<RoleList> Roles { get; set; }
        public List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }

    }
}
