using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyUpdateGetWithErrorMessages
    {
        [Key]
        public PropertyUpdateGet Property { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
