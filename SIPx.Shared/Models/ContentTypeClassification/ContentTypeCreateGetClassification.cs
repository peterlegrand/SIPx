using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreateGetClassification 
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ContentTypeClassificationStatusId { get; set; }
        public List<ContentTypeClassificationStatusList> ContentTypeClassificationStatuses { get; set; }

    }
}
