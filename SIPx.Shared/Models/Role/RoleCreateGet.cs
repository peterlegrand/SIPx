using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class RoleCreateGet
    {
        [Key]
        public string InternalName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int RoleGroupId { get; set; }

        public List<RoleGroupList> RoleGroups { get; set; }

    }
}
