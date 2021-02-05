using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessTypeList : INewProcessTypeList
    {
        public int ProcessTypeId { get; set; }
        [Key]
        public int ProcessTypeGroupId { get; set; }
        public string Name { get; set; }
        public string FileName { get; set; }
    }
}
