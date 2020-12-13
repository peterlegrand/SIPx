using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeGroupCreateGetWithErrorMessages
    {
        [Key]
        public ContentTypeGroupCreateGet ContentTypeGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
