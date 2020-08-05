using System;
using System.Collections.Generic;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessShowTemplateGroup
    {
        public int ProcessTemplateGroupId { get; set; }
        public string Name { get; set; }
        public List<NewProcessShowTemplate> templates { get; set; }
    }
    public class NewProcessShowTemplate
    {
        public int ProcessTemplateGroupId { get; set; }
        public int ProcessTemplateId { get; set; }
        public string Name { get; set; }
    }
}
