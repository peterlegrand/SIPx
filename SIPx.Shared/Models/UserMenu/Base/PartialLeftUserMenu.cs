using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class PartialLeftUserMenu
    {
        public string Name { get; set; }
        public string Icon { get; set; }
        public int UserMenuTypeIDLeft { get; set; }
        public int UserPageIdLeft { get; set; }
        public int UserMenuTypeIDRight { get; set; }
        public int UserPageIdRight { get; set; }
    }
}

