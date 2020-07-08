using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowCreateGet
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public int ProcessTemplateFromStageId { get; set; }
        public int ProcessTemplateToStageId { get; set; }
        public int DateLevelId { get; set; }
        public int OnTheFly { get; set; }
        public int Alhpabetically { get; set; }
        public int CanLink { get; set; }
        public int InDropDow { get; set; }
        public int InMenu { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public List<ProcessTemplateStageList> ProcessTemplateFromStages { get; set; }
        public List<ProcessTemplateStageList> ProcessTemplateToStages { get; set; }
        public List<DateLevelList> DateLevels { get; set; }
    }
}
