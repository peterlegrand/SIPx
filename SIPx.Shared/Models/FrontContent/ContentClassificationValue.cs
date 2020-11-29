using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentClassificationValue
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ClassificationValueId { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UserId { get; set; }
    }
}
