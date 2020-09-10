using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldList
    {
        [Key]
        public int ProcessTemplateFieldId { get; set; }
        public string Name { get; set; }

    }
}
