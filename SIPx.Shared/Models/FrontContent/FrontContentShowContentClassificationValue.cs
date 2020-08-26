using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentShowContentClassificationValue
    {
        [Key]
        public int ClassificationValueId { get; set; }
        public string ClassificationValueName { get; set; }
        public string ClassificationName { get; set; }
    }
}
