﻿using System;
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
        public List<MetaContentIndexGetList> MetaContentList { get; set; }
        public Dictionary<string, string> AllRouteData { get; set; }

    }
}
