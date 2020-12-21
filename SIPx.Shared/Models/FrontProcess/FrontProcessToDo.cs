using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessToDo
    {
        [Key]
        public int ProcessId { get; set; }
        public string ProcessTemplateName { get; set; }
        public string Subject { get; set; } 
        public string ProcesstemplateStage { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime  CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
