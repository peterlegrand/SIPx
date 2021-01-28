using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixToCreateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeMatrixToCreateGet ProjectTypeMatrix { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
