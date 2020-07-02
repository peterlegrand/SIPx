using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldList
    {
        [Key]
        public int ProcessTemplateFieldListId { get; set; }
        public string Name { get; set; }

    }
}
