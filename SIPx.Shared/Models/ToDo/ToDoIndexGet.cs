using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ToDoIndexGet
    {
        [Key]
        public int ProcessId { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateFieldName { get; set; }
        public string ProcessTemplateStageTypeName { get; set; }
        //public string Title { get; set; }
        //new
        public string ProcesstemplateStageName { get; set; }
        public string Subject { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
