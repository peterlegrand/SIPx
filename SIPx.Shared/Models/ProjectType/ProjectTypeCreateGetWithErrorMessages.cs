using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeCreateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeCreateGet ProjectType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
