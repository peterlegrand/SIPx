using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentNewClassification
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ClassificationValueId { get; set; }
        public string ClassificationName { get; set; }
        public string ControlOverlayClick { get; set; }
        public string ControlTarget { get; set; }
        public string ControlButton { get; set; }
        public string ControlDialog { get; set; }
        public string ControlA { get; set; }
        public string ControlB { get; set; }
        public List<FrontContentContentNewClassificationLevel> ClassificationLevels { get; set; }
        public List<FrontContentContentNewClassificationValue> ClassificationValues { get; set; }
    }
}
