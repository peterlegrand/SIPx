﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowCondition : IProcessTemplateFlowCondition
    {
        public int ProcessTemplateFlowId { get; set; }
        [Key]
        public int ProcessTemplateFlowConditionId { get; set; }
        public int ProcessTemplateFlowConditionTypeID { get; set; }
        public int? ProcessTemplateFieldID { get; set; }
        public int? ProcessTemplateFieldIDRole { get; set; }
        public int? ComparisonOperatorID { get; set; }
        public string ProcessTemplateFlowConditionString { get; set; }
        public int? ProcessTemplateFlowConditionInt { get; set; }
        public DateTime? ProcessTemplateFlowConditionDate { get; set; }


    }
}