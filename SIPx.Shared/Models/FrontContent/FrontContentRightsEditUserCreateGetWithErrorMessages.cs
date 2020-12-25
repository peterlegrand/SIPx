using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentRightsEditUserCreateGetWithErrorMessages
    {
        [Key]
        public FrontContentRightsEditUserCreateGet FrontContentRightsEditUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
