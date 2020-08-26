using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontUserIndexGetProject
    {
        [Key]
        public string RoleId { get; set; }
        public string RoleName { get; set; }
        public int ProjectId { get; set; }
        public string ProjectName { get; set; }

    }
}
