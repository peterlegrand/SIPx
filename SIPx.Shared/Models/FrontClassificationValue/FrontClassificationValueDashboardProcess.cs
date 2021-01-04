using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueDashboardProcess
    {
        [Key]
        public int ProcessId { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateSubjectName { get; set; }
        public string SubjectName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public int IconId { get; set; }
        public string IconFileName { get; set; }
        public string Color { get; set; }

    }
}
