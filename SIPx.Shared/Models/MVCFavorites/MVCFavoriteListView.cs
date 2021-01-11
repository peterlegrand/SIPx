using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteListView
    {
        [Key]
        public List<MVCFavoriteView> RootFavorites { get; set; }
        public List<MVCFavoriteGroupView> FavoriteGroups { get; set; }
    }
}
