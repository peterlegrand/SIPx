using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectList
    {
        [Key]
        public int ProjectId { get; set; }
        public string Name { get; set; }

    }
}
