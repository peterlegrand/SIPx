using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentType
    {
        [Key]
        public int ContentTypeID { get; set; }
        public int ContentTypeGroupID { get; set; }
        public string ContentTypeName { get; set; }

    }
}
