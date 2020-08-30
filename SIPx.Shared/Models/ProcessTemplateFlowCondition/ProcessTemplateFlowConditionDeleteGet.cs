using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowConditionDeleteGet
    {
        [Key]
        public int ProcessTemplateFlowConditionId { get; set; }
        public int ProcessTemplateFlowConditionTypeName { get; set; }
        public int ProcessTemplateFieldName { get; set; }
        public int ProcessTemplateFieldNameRole { get; set; }
        public int ComparisonOperatorName { get; set; }
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
    }
}
