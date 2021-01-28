using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixUpdateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeMatrixUpdateGet ProjectTypeMatrix { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
