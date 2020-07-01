using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassificationEditGet : IContentTypeClassificationEditGet
    {
        [Key]
        public int ContentTypeClassificationId { get; set; }
        public int ContentTypeId { get; set; }
        public int ClassificationId { get; set; }
        public string ContentTypeName { get; set; }
        public string ClassificationName { get; set; }
        public string ContentTypeClassificationStatusId { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<ContentTypeClassificationStatusList> ContentTypeClassificationStatuses { get; set; }
    }
}
