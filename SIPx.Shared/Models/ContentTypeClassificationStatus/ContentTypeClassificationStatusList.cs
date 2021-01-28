using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassificationStatusList
    {
        [Key]
        public int ObjectTypeClassificationStatusId { get; set; }
        public int ClassificationId { get; set; }
        public string Name { get; set; }

    }
}
