using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserUpdateGetWithErrorMessages
    {
        [Key]
        public UserUpdateGet User { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
