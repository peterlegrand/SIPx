﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuUpdateGet
    {

        public int UserMenuId { get; set; }
        public int IconId { get; set; }
        public int UserPageIdLeft { get; set; }
        public int UserPageIdRight { get; set; }
        public int UserMenuTypeIDLeft { get; set; }
        public int UserMenuTypeIDRight { get; set; }
        public int Sequence { get; set; }
        public string Name { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public List<IconList> Icons { get; set; }
        public List<SequenceList> UserMenus { get; set; }
        public List<PageList> Pages { get; set; }
        public List<UserMenuTypeList> UserMenuTypesLeft { get; set; }
        public List<UserMenuTypeList> UserMenuTypesRight { get; set; }
    }
}

