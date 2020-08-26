using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueIndexGetRole
    {
        [Key]
        public int ClassificationValueRoleID { get; set; }
        public int ClassificationRelationTypeID { get; set; }
        public int ClassificationValueID { get; set; }
        public string RoleID { get; set; }
        public string Name { get; set; }
        public string ClassificationRelationTypeName { get; set; }
    }
}
