using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessTemplateStageField
    {
        [Key]
        public int ProcessTemplateFieldStageId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateId { get; set; }
        public string StageName { get; set; }
        public string StatusName { get; set; }
        public string UpdateTypeName { get; set; }
        public DateTime DateTimeValue { get; set; }
        public int IntValue { get; set; }
        public string LocationValue { get; set; }
        public string StringValue { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public int Sequence { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
