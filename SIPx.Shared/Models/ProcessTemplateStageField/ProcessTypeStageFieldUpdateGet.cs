using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageFieldUpdateGet 
    {
        [Key]
        public int ProcessTypeStageFieldId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeStageId { get; set; }
        public int ProcessTypeId { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public int ProcessTypeStageFieldStatusId { get; set; }
        public string ProcessTypeFieldName { get; set; }
        public string ProcessTypeStageName{ get; set; }
        public int Sequence { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public int ProcessTypeFieldTypeId { get; set; }

        public List<ValueUpdateTypeList> ValueUpdateTypes { get; set; }
        public List<ProcessTypeStageFieldStatusList> ProcessTypeStageFieldStatuses { get; set; }

        public List<SequenceList> ProcessTypeFields { get; set; }
    }
}
