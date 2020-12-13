using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationTelecomCreateGetWithErrorMessages
    {
        [Key]
        public OrganizationTelecomCreateGet OrganizationTelecom { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
