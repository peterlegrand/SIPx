using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageFieldUpdateGet 
    {
        [Key]
        public int ProcessTemplateStageFieldId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateStageId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public int ProcessTemplateStageFieldStatusId { get; set; }
        public int Sequence { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<ValueUpdateTypeList> ValueUpdateTypes { get; set; }
        public List<ProcessTemplateStageFieldStatusList> ProcessTemplateStageFieldStatuses { get; set; }
        public List<int> Sequences { get; set; }

    }
}
