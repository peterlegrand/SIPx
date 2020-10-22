using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassDeleteGet
    {
        [Key]
        public int ProcessTemplateFlowPassId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public string ProcessTemplateFlowPassTypeName { get; set; }
        public string ProcessTemplateFieldName { get; set; }
        public string ProcessTemplateFieldNameRole { get; set; }
        public string Symbol { get; set; }
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
    }
}
