using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentTypeGroup
    {
        [Key]
        public int ContentTypeGroupId { get; set; }
        public string ContentTypeGroupName { get; set; }

        public List<FrontContentContentType> ContentTypes { get; set; }
    }
}
