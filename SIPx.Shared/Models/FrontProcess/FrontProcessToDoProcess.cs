using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessToDoProcess
    {
        [Key]
        public int ProcessId { get; set; }
        public int CreatorId { get; set; }
    }
}
