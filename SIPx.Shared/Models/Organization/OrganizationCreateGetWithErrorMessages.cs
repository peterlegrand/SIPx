using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationUserCreateGetWithErrorMessages
    {
        [Key]
        public OrganizationCreateGet Organization { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
