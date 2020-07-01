using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class RoleList
    {
        [Key]
        public string RoleId { get; set; }
        public string Name { get; set; }

    }
}
