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
        public string ProcessTypeName { get; set; }
        public string ProcessTypeFieldName { get; set; }
        public string ProcessTypeStageTypeName { get; set; }
        //public string Title { get; set; }
        //new
        public string ProcesstypeStageName { get; set; }
        public string Subject { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
