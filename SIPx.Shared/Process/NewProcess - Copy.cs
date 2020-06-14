using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcess : INewProcess
    {
        [Key]
        public int ProcessTemplateID { get; set; }
        public int ProcessTemplateFieldID { get; set; }
        public List<NewProcessField> ProcessFields { get; set; }
    }
}
