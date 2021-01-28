using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixFromUpdateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeMatrixFromUpdateGet ProjectTypeMatrix { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
