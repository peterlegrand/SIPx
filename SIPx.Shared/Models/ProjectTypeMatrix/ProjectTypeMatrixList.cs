using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixList
    {
        [Key]
        public int ProjectTypeMatrixId { get; set; }
        public string Name { get; set; }

    }
}
