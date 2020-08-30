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
        public string Title { get; set; }
    }
}
