﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldStageIndexGetStages 
    {
        [Key]
        public int ProcessTypeStageFieldId { get; set; }
        public int ProcessTypeStageId { get; set; }
        public string ProcessTypeStageName { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public string ProcessTypeFieldName { get; set; }
        public int ProcessTypeId { get; set; }
        public string ProcessTypeName { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public string ValueUpdateTypeName { get; set; }
        public int ProcessTypeStageFieldStatusId { get; set; }
        public string ProcessTypeStageFieldStatusName { get; set; }
        public int Sequence { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string StageName { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
