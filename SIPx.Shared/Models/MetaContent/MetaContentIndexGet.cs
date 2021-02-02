using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class MetaContentIndexGet
    {
        [Key]
        public int MetaRecordId { get; set; }
        public int MetaTypeId { get; set; }
        public bool HasCreateRights { get; set; }
        public bool HasDeleteRights { get; set; }
        public List<MetaContentIndexGetGrid> MetaContentList { get; set; }
        public Dictionary<string, string> AllRouteData { get; set; }

    }
}
