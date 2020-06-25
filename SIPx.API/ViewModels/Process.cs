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
        public int ProcessID { get; set; }
        public string ProcessTemplateName { get; set; }
        public string Subject { get; set; }
        public string ProcessTemplateStage { get; set; }
        public int? ProcessMultiID { get; set; }
        public int ProcessTemplateID { get; set; }
        public int ProcessTemplateStageID { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
