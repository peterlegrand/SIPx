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
        public int ProcessTemplateFlowConditionTypeID { get; set; }
        public int ProcessTemplateFieldID { get; set; }
        public int ProcessTemplateFieldIDRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int? ProcessTemplateFlowConditionInt { get; set; }
        public DateTime? ProcessTemplateFlowConditionDate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<int> Sequences { get; set; }
        public List<ProcessTemplateFlowConditionTypeList> ProcessTemplateFlowConditionTypes { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFields { get; set; }
        public List<ProcessTemplateFieldRoleList> ProcessTemplateFieldRoles { get; set; }
        public List<ComparisonOperatorList> ComparisonOperators { get; set; }

    }
}
