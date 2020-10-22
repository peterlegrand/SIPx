using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassUpdateGet 
    {
        [Key]
        public int ProcessTemplateFlowPassId { get; set; }
        public int ProcessTemplateFlowPassLanguageId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateLanguageId { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFlowPassTypeId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldIdRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTemplateFlowPassString { get; set; }
        public int? ProcessTemplateFlowPassInt { get; set; }
        public DateTime? ProcessTemplateFlowPassDate { get; set; }
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

        public List<SequenceList> Sequences { get; set; }
        public List<ProcessTemplateFlowPassTypeList> ProcessTemplateFlowPassTypes { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFields { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFieldRoles { get; set; }
        public List<ProcessTemplateFlowPassComparisonOperatorList> ComparisonOperators { get; set; }

    }
}
