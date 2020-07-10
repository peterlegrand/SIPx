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
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<ProcessTemplateStageList> ProcessTemplateStages { get; set; }

    }
}
