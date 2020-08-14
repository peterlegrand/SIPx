﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class RoleIndexGet
    {
        [Key]
        public string Id { get; set; }
        public int RoleLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorID { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatorName { get; set; }
        public string ModifierID { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifierName { get; set; }
    }
}
