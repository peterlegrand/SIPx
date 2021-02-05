using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageCreatePost : IProcessTypeStageCreatePost
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public int ProcessTypeStageTypeId { get; set; }
        public bool InToDo { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
    }
}
