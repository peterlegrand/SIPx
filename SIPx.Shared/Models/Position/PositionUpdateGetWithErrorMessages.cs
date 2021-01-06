using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PositionUpdateGetWithErrorMessages
    {
        [Key]
        public PositionUpdateGet Position { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
