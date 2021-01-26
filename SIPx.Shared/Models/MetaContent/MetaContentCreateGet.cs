using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MetaContentCreateGet
    {
        [Key]
        public int MetaContentId { get; set; }
        public string ContentId { get; set; }
        public int MetaContentTypeId { get; set; }
        public int MetaTypeId { get; set; }
        public int MetaRecordId { get; set; }
        public string UserId { get; set; }
        public List<ContentList> Contents { get; set; }
        public List<MetaContentTypeList> MetaContentTypes { get; set; }
        public Dictionary<string, string> AllRouteData { get; set; }
    }
}
