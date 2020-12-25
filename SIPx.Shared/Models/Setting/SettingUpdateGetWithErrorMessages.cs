using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class SettingUpdateGetWithErrorMessages
    {
        [Key]
        public SettingUpdateGet Setting { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
