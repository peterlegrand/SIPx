using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Process
    {
        [Key]
        public int ProcessId { get; set; }
        public string ProcessTemplateName { get; set; }
        public string Subject { get; set; }
        public string ProcessTemplateStage { get; set; }
        public int? ProcessMultiId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateStageId { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
