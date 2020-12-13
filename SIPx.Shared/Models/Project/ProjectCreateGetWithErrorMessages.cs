using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectCreateGetWithErrorMessages
    {
        [Key]
        public ProjectCreateGet Project { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
