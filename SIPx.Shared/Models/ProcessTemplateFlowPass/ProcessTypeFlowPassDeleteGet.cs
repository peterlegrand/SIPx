using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowPassDeleteGet
    {
        [Key]
        public int ProcessTypeFlowPassId { get; set; }
        public int ProcessTypeFlowId { get; set; }
        public string ProcessTypeFlowPassTypeName { get; set; }
        public string ProcessTypeFieldName { get; set; }
        public string ProcessTypeFieldNameRole { get; set; }
        public string Symbol { get; set; }
        public string ProcessTypeFlowPassString { get; set; }
        public int? ProcessTypeFlowPassInt { get; set; }
        public DateTime? ProcessTypeFlowPassDate { get; set; }
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
