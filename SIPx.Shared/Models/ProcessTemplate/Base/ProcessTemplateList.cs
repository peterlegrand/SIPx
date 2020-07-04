using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateList
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public string Name { get; set; }

    }
}
