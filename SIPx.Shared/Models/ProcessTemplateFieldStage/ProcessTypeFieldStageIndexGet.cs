using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFieldStageIndexGet 
    {
        [Key]
        public int ProcessTypeFieldId { get; set; }
        public string ProcessTypeFieldName { get; set; }
        //public int ProcessTypeId { get; set; }
        //public string ProcessTypeName { get; set; }
        //public string CreatorName { get; set; }
        //public string CreatorId { get; set; }
        //public DateTime CreatorDate { get; set; }
        //public string ModifierName { get; set; }
        //public string ModifierId { get; set; }
        //public DateTime ModifiedDate { get; set; }
        public List<ProcessTypeFieldStageIndexGetStages> Stages { get; set; }
    }
}
