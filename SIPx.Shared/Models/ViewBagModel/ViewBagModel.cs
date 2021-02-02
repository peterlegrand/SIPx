using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ViewBagModel
    {
        public List<UITermLanguageCustomizationList> UITerms { get; set; }
        public List<MVCFavoriteMenu> Favorites { get; set; }
        public List<MVCFavoriteGroupList> FavoriteGroupList { get; set; }
        public string Env { get; set; }
        public string MVCUIScreenId { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
        public List<ReadLogGet> ReadLogGetGrid { get; set; }

    }
}
