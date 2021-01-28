using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassificationUpdateGet 
    {
        [Key]
        public int ContentTypeClassificationId { get; set; }
        public int ContentTypeId { get; set; }
        public int ClassificationId { get; set; }
        public string ContentTypeName { get; set; }
        public string ClassificationName { get; set; }
        public string ObjectTypeClassificationStatusId { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<ContentTypeClassificationStatusList> ContentTypeClassificationStatuses { get; set; }
    }
}
