using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassIndexGet 
    {
        [Key]
        public int ProcessTemplateFlowPassId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public string ProcessTemplateFlowName { get; set; }
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public int ProcessTemplateLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFlowPassTypeID { get; set; }
        public string ProcessTemplateFlowPassTypeName { get; set; }
        public int ProcessTemplateFieldID { get; set; }
        public string ProcessTemplateFieldName { get; set; }
        public int ProcessTemplateFieldIDRole { get; set; }
        public string ProcessTemplateFieldNameRole { get; set; }
        public int ComparisonOperatorID { get; set; }
        public string ComparisonOperatorName { get; set; }
        public string ProcessTemplateFlowPassString { get; set; }
        public int? ProcessTemplateFlowPassInt { get; set; }
        public DateTime? ProcessTemplateFlowPassDate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
