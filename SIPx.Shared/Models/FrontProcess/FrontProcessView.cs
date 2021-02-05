using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessView
    {
        [Key]
        public int ProcessId { get; set; }
        public int ProcessTypeId { get; set; }
        public int ProcessTypeStageID { get; set; }
        public int ProcessTypeStageTypeID { get; set; }
        public string ProcessTypeStageTypeName { get; set; }
        public string ProcessTypeName { get; set; }
        public string ProcessTypeStageName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<FrontProcessViewGetField> ProcessFields { get; set; }
    }
}
