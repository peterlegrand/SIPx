using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentNewClassificationValue
    {
        [Key]
        public int ClassificationValueId { get; set; }
        public int ClassificationID { get; set; }

        public string Name { get; set; }
    }
}
