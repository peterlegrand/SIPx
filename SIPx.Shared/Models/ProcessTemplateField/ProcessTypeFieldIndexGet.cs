using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldIndexGet
    {
        [Key]
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public int ProcessTypeFieldTypeId { get; set; }
        public string ProcessTypeFieldTypeName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string MissingValueText { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
