using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyValueUpdateGetWithErrorMessages
    {
        [Key]
        public PropertyValueUpdateGet PropertyValue { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
