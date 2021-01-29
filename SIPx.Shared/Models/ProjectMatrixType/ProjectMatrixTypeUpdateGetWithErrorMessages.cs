using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectMatrixTypeUpdateGetWithErrorMessages
    {
        [Key]
        public ProjectMatrixTypeUpdateGet ProjectMatrixType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
