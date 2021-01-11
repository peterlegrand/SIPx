using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteAdd
    {
        [Key]
        public string controller { get; set; }
        public string action { get; set; }
        public int? routeId { get; set; }
        public string UserId { get; set; }
        public string Name { get; set; }
        public int? Sequence { get; set; }
        public int? MVCFavoriteGroupId { get; set; }
    }
   
}
