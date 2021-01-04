using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueDashboardContent
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
        public string ContentTypeName { get; set; }
        public string StatusName { get; set; }
    }
}
