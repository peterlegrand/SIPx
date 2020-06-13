using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessTemplateList : INewProcessTemplateList
    {
        public int ProcessTemplateID { get; set; }
        [Key]
        public int ProcessTemplateGroupID { get; set; }
        public string Name { get; set; }
    }
}
