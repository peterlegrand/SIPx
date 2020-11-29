using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessEditGet
    {
        [Key]
        public int ProcessId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateStageID { get; set; }
        public int ProcessTemplateStageTypeID { get; set; }
        public string StageTypeName { get; set; }
        public string TemplateName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<FrontProcessEditGetField> ProcessFields { get; set; }
    }
}
