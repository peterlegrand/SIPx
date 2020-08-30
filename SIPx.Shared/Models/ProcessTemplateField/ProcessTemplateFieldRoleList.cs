using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldRoleList
    {
        [Key]
        public int ProcessTemplateFieldIdRole { get; set; }
        public string Name { get; set; }

    }
}
