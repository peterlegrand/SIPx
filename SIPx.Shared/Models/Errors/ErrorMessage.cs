using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ErrorMessage
    {
        [Key]
        public int ErrorMessageId { get; set; }
        public string Name { get; set; }
    }
}
