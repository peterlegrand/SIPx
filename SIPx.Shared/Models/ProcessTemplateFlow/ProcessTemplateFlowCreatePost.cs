using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowCreatePost 
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateFromStageId { get; set; }
        public int ProcessTemplateToStageId { get; set; }
        public int OnTheFly { get; set; }
        public int Alhpabetically { get; set; }
        public int CanLink { get; set; }
        public int InDropDow { get; set; }
        public int InMenu { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public string UserId { get; set; }
    }
}
