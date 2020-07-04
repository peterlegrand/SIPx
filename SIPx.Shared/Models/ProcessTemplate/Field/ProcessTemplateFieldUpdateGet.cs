using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldUpdateGet 
    {
        [Key]
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldLanguageId { get; set; }
        public int ProcessTemplateFieldTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<ProcessTemplateFieldTypeList> ProcessTemplateFieldTypes { get; set; }

    }
}
