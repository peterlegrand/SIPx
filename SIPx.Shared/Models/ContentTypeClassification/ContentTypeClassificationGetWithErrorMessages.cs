using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassificationUpdateGetWithErrorMessages
    {
        [Key]
        public ContentTypeClassificationUpdateGet ContentTypeClassification { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
