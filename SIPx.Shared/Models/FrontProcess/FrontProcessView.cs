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
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateStageID { get; set; }
        public int ProcessTemplateStageTypeID { get; set; }
        public string ProcessTemplateStageTypeName { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateStageName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<FrontProcessViewGetField> ProcessFields { get; set; }
    }
}
