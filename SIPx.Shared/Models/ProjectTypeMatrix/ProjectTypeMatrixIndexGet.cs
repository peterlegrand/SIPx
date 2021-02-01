using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixIndexGet 
    {
        [Key]
        public int ProjectTypeId { get; set; }
        public string ProjectTypeName { get; set; }
        public List<ProjectTypeMatrixIndexGetGrid> Matrix { get; set; }

    }
}
