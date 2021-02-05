using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionDeleteGet
    {
        [Key]
        public int ProcessTypeFlowConditionId { get; set; }
        public int ProcessTypeFlowId { get; set; }
        public string ProcessTypeFlowConditionTypeName { get; set; }
        public string ProcessTypeFieldName { get; set; }
        public string ProcessTypeFieldNameRole { get; set; }
        public string Symbol { get; set; }
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
        public string UserId { get; set; }
    }
}
