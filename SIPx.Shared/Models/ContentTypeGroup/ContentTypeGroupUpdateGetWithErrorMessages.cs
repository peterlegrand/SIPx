using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeGroupUpdateGetWithErrorMessages
    {
        [Key]
        public ContentTypeGroupUpdateGet ContentTypeGroupUser { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
