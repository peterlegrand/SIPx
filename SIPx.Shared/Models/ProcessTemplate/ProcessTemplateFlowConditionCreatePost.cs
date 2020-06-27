using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionCreatePost : IProcessTemplateFlowConditionCreatePost
    {
        [Key]
        public int ProcessTemplateFlowID { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFlowConditionTypeID { get; set; }
        public int ProcessTemplateFieldID { get; set; }
        public int ProcessTemplateFieldIDRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int ProcessTemplateFlowConditionInt { get; set; }
        public DateTime ProcessTemplateFlowConditionDate { get; set; }
        public int LanguageID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserID { get; set; }
    }
}
