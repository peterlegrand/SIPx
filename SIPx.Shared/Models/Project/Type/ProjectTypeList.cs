using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeList
    {
        [Key]
        public int ProjectTypeId { get; set; }
        public string Name { get; set; }

    }
}
