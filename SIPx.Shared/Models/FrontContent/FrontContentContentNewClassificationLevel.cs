using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentNewClassificationLevel
    {
        [Key]
        public int Sequence { get; set; }
        public bool Alphabetically { get; set; }
        public bool CanLink { get; set; }
        public string ControlDropDownListId { get; set; }
        public string ControlChange { get; set; }
        public int SelectedClassificationValueId { get; set; }
        public List<FrontContentContentNewClassificationValue> ClassificationValues { get; set; }
    }
}
