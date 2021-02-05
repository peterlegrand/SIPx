using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowCreateGet
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public string ProcessTypeName { get; set; }
        public int ProcessTypeFromStageId { get; set; }
        public int ProcessTypeToStageId { get; set; }
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
        public string UserId { get; set; }
        public List<ProcessTypeStageList> ProcessTypeStages { get; set; }
    }
}
