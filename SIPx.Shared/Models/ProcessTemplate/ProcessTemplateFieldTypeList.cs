using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFieldTypeList
    {
        [Key]
        public int ProcessTemplateFieldTypeId { get; set; }
        public string Name { get; set; }

    }
}
