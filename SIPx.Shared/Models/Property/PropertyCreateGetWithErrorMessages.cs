using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyCreateGetWithErrorMessages
    {
        [Key]
        public PropertyCreateGet Property { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
