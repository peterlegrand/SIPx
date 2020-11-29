using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuCreatePost
    {
        public string Name { get; set; }
        public int IconId { get; set; }
        public int UserPageIdLeft { get; set; }
        public int UserPageIdRight { get; set; }
        public int UserMenuTypeIDLeft { get; set; }
        public int UserMenuTypeIDRight { get; set; }
        public int Sequence { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
    }
}

