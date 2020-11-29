using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRoleCreateGet
    {
        [Key]
        public string RoleId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string UserId { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }
    }
}
