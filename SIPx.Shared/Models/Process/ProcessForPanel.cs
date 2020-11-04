using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessForPanel
    {
        [Key]
        public int ProcessId { get; set; }
        public string Subject { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateStageName { get; set; }
        public string ProcessTemplateStageTypeName { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public String ControlId { get; set; }

    }
}
