using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MetaContentCreateGetWithErrorMessages
    {
        [Key]
        public MetaContentCreateGet MetaContent { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
