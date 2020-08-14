using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UITermIndexGet
    {
        [Key]
        public int UITermId { get; set; }
        public string InternalName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MouseOver { get; set; }
        public string Customization { get; set; }
    }
}
