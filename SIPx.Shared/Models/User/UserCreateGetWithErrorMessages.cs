using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserCreateGetWithErrorMessages
    {
        [Key]
        public UserCreateGet User { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
