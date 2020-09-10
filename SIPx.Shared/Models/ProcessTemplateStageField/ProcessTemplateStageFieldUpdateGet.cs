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
        public string ProcessTemplateFieldName { get; set; }
        public string ProcessTemplateStageName{ get; set; }
        public int Sequence { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<ValueUpdateTypeList> ValueUpdateTypes { get; set; }
        public List<ProcessTemplateStageFieldStatusList> ProcessTemplateStageFieldStatuses { get; set; }

        public List<ProcessTemplateFieldList> ProcessTemplateFields { get; set; }
    }
}
