using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageCreateGet
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public string ProcessTypeName { get; set; }
        public int ProcessTypeStageTypeId { get; set; }
        public bool InToDo { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<ProcessTypeStageTypeList> ProcessTypeStageTypes { get; set; }
    }
}
