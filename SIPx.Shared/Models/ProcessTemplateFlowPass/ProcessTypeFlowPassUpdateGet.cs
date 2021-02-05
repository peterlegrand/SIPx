﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowPassUpdateGet 
    {
        [Key]
        public int ProcessTypeFlowPassId { get; set; }
        public int ProcessTypeFlowPassLanguageId { get; set; }
        public int ProcessTypeFlowId { get; set; }
        public int ProcessTypeId { get; set; }
        public int ProcessTypeLanguageId { get; set; }
        public int Sequence { get; set; }
        public int ProcessTypeFlowPassTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldIdRole { get; set; }
        public int ComparisonOperatorId { get; set; }
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

        public List<SequenceList> Sequences { get; set; }
        public List<ProcessTypeFlowPassTypeList> ProcessTypeFlowPassTypes { get; set; }
        public List<ProcessTypeFieldList> ProcessTypeFields { get; set; }
        public List<ProcessTypeFieldList> ProcessTypeFieldRoles { get; set; }
        public List<ProcessTypeFlowPassComparisonOperatorList> ComparisonOperators { get; set; }

    }
}
