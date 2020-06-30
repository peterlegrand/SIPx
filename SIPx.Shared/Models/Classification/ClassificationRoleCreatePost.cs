using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRoleCreatePost : IClassificationRoleCreatePost
    {
        [Key]
        public string @RoleId { get; set; }
        public int @ClassificationId { get; set; }
        public int @ClassificationRelationTypeId { get; set; }
        public string UserId { get; set; }
    }
}
