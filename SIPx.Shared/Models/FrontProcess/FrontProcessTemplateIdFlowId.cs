using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessTemplateIdFlowId
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
    }
}
