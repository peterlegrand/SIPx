using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FavoritesAdd
    {
        [Key]
        public string controller { get; set; }
        public string action { get; set; }
        public string UserId { get; set; }
    }
}
