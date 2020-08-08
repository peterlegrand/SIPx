﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuCreateGet
    {
        public string Icon { get; set; }
        public int UserPageIdLeft { get; set; }
        public int UserPageIdRight { get; set; }
        public string UserId { get; set; }
        public int Sequence { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public List<IconList> Icons { get; set; }
        public List<SequenceList> UserMenus { get; set; }
        public List<PageList> Pages { get; set; }
    }
}

