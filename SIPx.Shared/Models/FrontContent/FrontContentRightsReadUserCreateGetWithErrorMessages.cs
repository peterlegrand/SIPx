using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentRightsReadUserCreateGetWithErrorMessages
    {
        [Key]
        public FrontContentRightsReadUserCreateGet FrontContentRightsReadUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
