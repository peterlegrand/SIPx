using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldUpdateGet
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateFieldId { get; set; }

        public string ProcessTemplateName { get; set; }
        public int ProcessTemplateFieldTypeId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public List<ProcessTemplateFieldTypeList> ProcessTemplateFieldTypes { get; set; }
    }
}
