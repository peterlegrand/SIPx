using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueDashboardRole
    {
        [Key]
        public int ClassificationValueRoleId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public int ClassificationValueId { get; set; }
        public string RoleId { get; set; }
        public string Name { get; set; }
        public string RoleName { get; set; }
        public string ClassificationRelationTypeName { get; set; }
    }
}
