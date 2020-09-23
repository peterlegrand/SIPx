using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessAdvancedSearchResult
    {
        [Key]
        public int ProcessID { get; set; }
        public string Subject { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateStageName { get; set; }
        public string ProcessTemplateIcon { get; set; }
        public string ProcessTemplateStageTypeColor { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
    }
}
