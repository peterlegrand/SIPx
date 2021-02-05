using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowPassCreatePost 
    {
        [Key]
        public int ProcessTypeFlowId { get; set; }
        public int Sequence { get; set; }
        public int ProcessTypeFlowPassTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldIDRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTypeFlowPassString { get; set; }
        public int ProcessTypeFlowPassInt { get; set; }
        public DateTime ProcessTypeFlowPassDate { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreaterId { get; set; }
        public string UserId { get; set; }
    }
}
