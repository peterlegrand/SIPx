using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueRoleIndexGet : IClassificationValueRoleIndexGet
    {
        [Key]
        public int ClassificationValueRoleId { get; set; }
        public string RoleId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
