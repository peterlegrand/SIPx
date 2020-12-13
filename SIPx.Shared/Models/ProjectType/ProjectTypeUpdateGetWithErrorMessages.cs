using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeUpdateGetWithErrorMessages
    {
        [Key]
        public ProjectTypeUpdateGet ProjectType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
