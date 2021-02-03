﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeCreateGet 
    { 
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CodePrefix { get; set; }
        public string CodeSuffix { get; set; }
        public int CodeTypeId { get; set; }
        public bool HasAnyChildProject { get; set; }
        public bool HasAnyMatrixProject { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public string UserId { get; set; }
        public List<IconList> Icons { get; set; }
        public List<CodeTypeList> CodeTypes { get; set; }

    }
}
