using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class Process
    {
        [Key]
        public int ProcessId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public string ProcessTypeName { get; set; }
        public string Subject { get; set; }
        public string ProcessTypeStage { get; set; }
        public int? ProcessMultiId { get; set; }
        public int ProcessTypeId { get; set; }
        public int ProcessTypeStageId { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
