using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProjectIndexGetProcess
    {
        [Key]
        public int ProcessId { get; set; }
        public string Subject { get; set; }
        public string ProcessTypeStageTypeName { get; set; }
        public string ProcessTypeName { get; set; }
        public string TemplateColor { get; set; }
        public string StageTypeColor { get; set; }
        public string TemplateIconFileName { get; set; }
        public string StageTypeIconFileName { get; set; }
    }
}
