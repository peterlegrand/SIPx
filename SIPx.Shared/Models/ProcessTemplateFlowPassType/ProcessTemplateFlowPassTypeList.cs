using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassTypeList
    {
        [Key]
        public int ProcessTemplateFlowPassTypeId { get; set; }
        public string Name { get; set; }

    }
}
