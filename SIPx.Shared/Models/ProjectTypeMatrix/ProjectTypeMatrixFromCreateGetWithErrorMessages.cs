using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixFromCreateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeMatrixFromCreateGet ProjectTypeMatrix { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
