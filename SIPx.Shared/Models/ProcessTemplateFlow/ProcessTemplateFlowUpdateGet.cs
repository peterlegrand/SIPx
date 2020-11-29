using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowUpdateGet 
    {
        [Key]
        public int ProcessTemplateFlowId { get; set; }
        public int ProcessTemplateFlowLanguageId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateFromStageId { get; set; }
        public int ProcessTemplateToStageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<ProcessTemplateStageList> ProcessTemplateStages { get; set; }

    }
}
