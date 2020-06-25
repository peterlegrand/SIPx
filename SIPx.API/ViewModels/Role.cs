using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Role
    {
        [Key]
        public string RoleID { get; set; }
        public string InternalName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int RoleGroupID { get; set; }
        public int Sequence { get; set; }
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public string GroupMenuName { get; set; }
        public string GroupMouseOver { get; set; }

    }
}
