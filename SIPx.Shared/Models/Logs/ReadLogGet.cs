using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ReadLogGet
    {
        [Key]
        public int ReadLogId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public int PersonId { get; set; }
        public DateTime ReadLogDate { get; set; }
    }
}
