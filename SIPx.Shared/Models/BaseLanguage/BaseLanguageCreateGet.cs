using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class BaseLanguageCreateGet
    {
        [Key]
        public int BaseId { get; set; }
        public string BaseType { get; set; }
        public string UITermTitle { get; set; }
        public int? BaseParentId { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<LanguageList> Languages { get; set; }
    }
}
