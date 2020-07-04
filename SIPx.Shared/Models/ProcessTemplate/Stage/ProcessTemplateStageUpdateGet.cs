using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageUpdateGet 
    {
        [Key]
        public int ProcessTemplateStageId { get; set; }
        public int ProcessTemplateStageLanguageId { get; set; }
        public int ProcessTemplateId { get; set; }
        public bool IsEndStage { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
