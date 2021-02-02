using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class MetaContentIndexGetGrid
    {
        [Key]
        public int MetaContentId { get; set; }
        public string Title { get; set; }
        public string LanguageName { get; set; }
        public int ContentId { get; set; }
        public int MetaContentTypeId { get; set; }
        public string MetaContentTypeName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
