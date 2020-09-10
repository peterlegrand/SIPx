using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionUpdateGet 
    {
        [Key]
        public int ProcessTemplateFlowConditionId { get; set; }
        public int ProcessTemplateFlowConditionLanguageId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateLanguageId { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFlowConditionTypeId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldIdRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int? ProcessTemplateFlowConditionInt { get; set; }
        public DateTime? ProcessTemplateFlowConditionDate { get; set; }
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
        public List<ProcessTemplateFlowConditionTypeList> ProcessTemplateFlowConditionTypes { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFields { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFieldRoles { get; set; }
        public List<ProcessTemplateFlowConditionComparisonOperatorList> ComparisonOperators { get; set; }

    }
}
