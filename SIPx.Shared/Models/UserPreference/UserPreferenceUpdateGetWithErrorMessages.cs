using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserPreferenceUpdateGetWithErrorMessages
    {
        [Key]
        public UserPreferenceUpdateGet UserPreference { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
