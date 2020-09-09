using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class RoleGroupList
    {
        [Key]
        public int RoleGroupId { get; set; }
        public string Name { get; set; }

    }
}
