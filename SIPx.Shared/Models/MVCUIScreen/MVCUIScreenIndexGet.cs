using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class MVCUIScreenIndexGet
    {
        [Key]
        public int MVCUIScreenId { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public bool IsLogRecordGrid { get; set; }
        public string ScreenName { get; set; }

    }
}
