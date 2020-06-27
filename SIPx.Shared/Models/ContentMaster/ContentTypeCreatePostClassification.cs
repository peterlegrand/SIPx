using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreatePostClassification : IContentTypeCreatePostClassification
    {
        [Key]
        public int ClassificationID { get; set; }
        public int ContentTypeClassificationStatusID { get; set; }
    }
}
