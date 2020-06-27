using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageCreatePost : IProcessTemplateStageCreatePost
    {
        [Key]
        public int ProcessTemplateID { get; set; }
        public int ProcessTemplateTypeID { get; set; }
        public bool IsEndStage { get; set; }
        public int LanguageID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserID { get; set; }
    }
}
