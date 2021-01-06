using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationPositionUpdateGetWithErrorMessages
    {
        [Key]
        public OrganizationPositionUpdateGet OrganizationPosition { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
