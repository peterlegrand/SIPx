using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteMenu
    {
        [Key]
        public string id { get; set; }
        public string text { get; set; }
        public string url { get; set; }
        public string parentId { get; set; }
    }

}
