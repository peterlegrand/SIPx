using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationUpdateGetWithErrorMessages
    {
        [Key]
        public OrganizationUpdateGet Organization { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
