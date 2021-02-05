using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessTypeIdFlowId
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public int ProcessTypeFlowId { get; set; }
    }
}
