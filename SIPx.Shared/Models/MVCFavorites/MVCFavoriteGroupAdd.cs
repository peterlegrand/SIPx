using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteGroupAdd
    {
        [Key]
        public string UserId { get; set; }
        public string Name { get; set; }
        public int Sequence { get; set; }
    }
}
