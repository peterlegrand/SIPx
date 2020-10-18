using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassification
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ContentTypeId { get; set; }
        public int ContentTypelassificationStatusId { get; set; }
    }
}
