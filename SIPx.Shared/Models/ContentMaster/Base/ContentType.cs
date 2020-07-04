using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentType : IContentType
    {
        [Key]
        public int ContentTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string GroupName { get; set; }
        public string SecurityLevelName { get; set; }
        public string ProcessName { get; set; }
        public string ProcessGroupName { get; set; }

    }
}
