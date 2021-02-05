using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionIndexGet 
    {
        [Key]
        public int ProcessTypeFlowConditionId { get; set; }
        public int ProcessTypeFlowId { get; set; }
        public string ProcessTypeFlowName { get; set; }
        public int ProcessTypeId { get; set; }
        public string ProcessTypeName { get; set; }
        public int ProcessTypeLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public int Sequence { get; set; }
        public int ProcessTypeFlowConditionTypeID { get; set; }
        public string ProcessTypeFlowConditionTypeName { get; set; }
        public int ProcessTypeFieldID { get; set; }
        public string ProcessTypeFieldName { get; set; }
        public int ProcessTypeFieldIDRole { get; set; }
        public string ProcessTypeFieldNameRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ComparisonOperatorName { get; set; }
        public string ProcessTypeFlowConditionString { get; set; }
        public int? ProcessTypeFlowConditionInt { get; set; }
        public DateTime? ProcessTypeFlowConditionDate { get; set; }
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
    }
}
