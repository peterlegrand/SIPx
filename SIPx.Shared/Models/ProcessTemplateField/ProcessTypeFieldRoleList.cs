using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldRoleList
    {
        [Key]
        public int ProcessTypeFieldIdRole { get; set; }
        public string Name { get; set; }

    }
}
