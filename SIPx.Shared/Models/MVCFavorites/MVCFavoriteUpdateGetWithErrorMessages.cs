using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteUpdateGetWithErrorMessages
    {
        [Key]
        public MVCFavoriteUpdateGet MVCFavorite { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
