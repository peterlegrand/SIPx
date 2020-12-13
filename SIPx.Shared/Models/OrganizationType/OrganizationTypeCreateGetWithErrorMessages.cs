using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationTypeCreateGetWithErrorMessages
    {
        [Key]
        public OrganizationTypeCreateGet OrganizationType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
