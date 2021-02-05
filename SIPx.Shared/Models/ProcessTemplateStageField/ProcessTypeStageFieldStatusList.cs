using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeStageFieldStatusList
    {
        [Key]
        public int ProcessTypeStageFieldStatusId { get; set; }
        public string Name { get; set; }

    }
}
