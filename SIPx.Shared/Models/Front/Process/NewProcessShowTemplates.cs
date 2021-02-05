using System;
using System.Collections.Generic;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessShowTemplateGroup
    {
        public int ProcessTypeGroupId { get; set; }
        public string Name { get; set; }
        public List<NewProcessTypeList> templates { get; set; }
    }
    //public class NewProcessShowTemplate
    //{
    //    public int ProcessTypeGroupId { get; set; }
    //    public int ProcessTypeId { get; set; }
    //    public string Name { get; set; }
    //}
}
