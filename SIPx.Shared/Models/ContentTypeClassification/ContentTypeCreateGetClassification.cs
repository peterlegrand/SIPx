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
        public int ObjectTypeClassificationStatusId { get; set; }
        public string Name { get; set; }
        public string MouseOver { get; set; }
        public string ControlA { get; set; }
        public string ControlB { get; set; }
        public string ControlC { get; set; }

    }
}
