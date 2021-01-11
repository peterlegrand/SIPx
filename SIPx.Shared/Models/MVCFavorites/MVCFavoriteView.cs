using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteView
    {
        [Key]
        public string Name { get; set; }
        public string controller { get; set; }
        public string action { get; set; }
        public int? routeId { get; set; }

    }
}
