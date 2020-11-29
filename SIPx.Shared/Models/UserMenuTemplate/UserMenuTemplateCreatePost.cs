using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuTemplateOptionCreatePost
    {

        public int UserMenuTemplateId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int UserPageLeftId { get; set; }
        public int UserPageRightId { get; set; }
        public int Sequence { get; set; }
        public string Icon { get; set; }
        public string UserId { get; set; }
    }
}

