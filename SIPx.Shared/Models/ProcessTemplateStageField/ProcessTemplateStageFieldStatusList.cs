using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateStageFieldStatusList
    {
        [Key]
        public int ProcessTemplateStageFieldStatusId { get; set; }
        public string Name { get; set; }

    }
}
