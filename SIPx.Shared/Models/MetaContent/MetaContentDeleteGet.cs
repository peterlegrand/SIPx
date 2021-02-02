using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MetaContentDeleteGet
    {
        [Key]
        public int MetaContentId { get; set; }
        public string ContentId { get; set; }
        public string Title { get; set; }
        public string LanguageName { get; set; }
        public int MetaContentTypeId { get; set; }
        public string MetaContentTypeName { get; set; }
        public int MetaTypeId { get; set; }
        public string MetaTypeName { get; set; }
        public string MetaRecordId { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UserId { get; set; }
    }
}
