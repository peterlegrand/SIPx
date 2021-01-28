using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixCreateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeMatrixCreateGet ProjectTypeMatrix { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
