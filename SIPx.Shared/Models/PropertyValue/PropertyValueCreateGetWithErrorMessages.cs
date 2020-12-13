using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyValueCreateGetWithErrorMessages
    {
        [Key]
        public PropertyValueCreateGet PropertyValue { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
