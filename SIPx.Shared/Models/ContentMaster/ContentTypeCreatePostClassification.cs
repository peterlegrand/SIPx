using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreatePostClassification : IContentTypeCreatePostClassification
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ContentTypeClassificationStatusId { get; set; }
    }
}
