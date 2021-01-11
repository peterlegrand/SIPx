using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteRootMenu
    {
        [Key]
        public string text { get; set; }
        public List<MVCFavoriteMenu> Favorites { get; set; }
//        public List<MVCFavoriteMenuGroup> FavoriteGroups { get; set; }
    }
}
