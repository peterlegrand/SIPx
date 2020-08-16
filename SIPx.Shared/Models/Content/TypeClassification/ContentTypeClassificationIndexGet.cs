using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassificationIndexGet
    {
        [Key]
        public int ContentTypeClassificationId { get; set; }
        public int ContentTypeId { get; set; }
        public int ClassificationId { get; set; }
        public string ContentTypeName { get; set; }
        public string ClassificationName { get; set; }
        public int ContentTypeClassificationStatusId { get; set; }
        public string ContentTypeClassificationStatusName { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
