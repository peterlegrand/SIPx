using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteGroupList
    {
        [Key]
        public int MVCFavoriteGroupId { get; set; }
        public string Name { get; set; }

    }
}
