using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowIndexGet
    {
        [Key]
        public int ProcessTemplateFlowId { get; set; }
        public int ProcessTemplateFlowLanguageId { get; set; }
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public int ProcessTemplateFromFieldId { get; set; }
        public string ProcessTemplateFromFieldName { get; set; }
        public int ProcessTemplateToFieldId { get; set; }
        public string ProcessTemplateToFieldName { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
