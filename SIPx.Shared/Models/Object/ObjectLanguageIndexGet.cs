using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared { 
    public class BaseLanguageIndexGet
    {
        [Key]
        public int BaseId { get; set; }
        public string BaseType { get; set; }
        public string UITermTitle { get; set; }
        public string UITermBack { get; set; }
        public List<BaseLanguageIndexGetGrid> BaseLanguageIndexGetGrids { get; set; }
    }
}
