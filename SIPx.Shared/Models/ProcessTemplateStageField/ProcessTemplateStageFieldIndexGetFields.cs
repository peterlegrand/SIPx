using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageFieldIndexGetFields 
    {
        [Key]
        public int ProcessTemplateStageFieldId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public string ProcessTemplateFieldName { get; set; }
        public int ProcessTemplateStageId { get; set; }
        public string ProcessTemplateStageName { get; set; }
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public string ValueUpdateTypeName { get; set; }
        public int ProcessTemplateStageFieldStatusId { get; set; }
        public string ProcessTemplateStageFieldStatusName { get; set; }
        public int Sequence { get; set; }
        public string StringValue { get; set; }
        public int IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string FieldName { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
