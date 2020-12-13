using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectUpdateGetWithErrorMessages
    {
        [Key]
        public ProjectUpdateGet Project { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
