using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldStageIndexGet 
    {
        [Key]
        public int ProcessTemplateFieldId { get; set; }
        public string ProcessTemplateFieldName { get; set; }
        //public int ProcessTemplateId { get; set; }
        //public string ProcessTemplateName { get; set; }
        //public string CreatorName { get; set; }
        //public string CreatorId { get; set; }
        //public DateTime CreatorDate { get; set; }
        //public string ModifierName { get; set; }
        //public string ModifierId { get; set; }
        //public DateTime ModifiedDate { get; set; }
        public List<ProcessTemplateFieldStageIndexGetStages> Stages { get; set; }
    }
}
