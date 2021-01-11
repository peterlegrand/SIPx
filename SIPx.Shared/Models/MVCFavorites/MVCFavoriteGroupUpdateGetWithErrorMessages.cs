using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteGroupUpdateGetWithErrorMessages
    {
        [Key]
        public MVCFavoriteGroupUpdateGet MVCFavoriteGroup { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
