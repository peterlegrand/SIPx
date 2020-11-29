using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuDeleteGet
    {

        public int UserMenuId { get; set; }
        public string IconName { get; set; }
        public string UserPageNameLeft { get; set; }
        public string UserPageNameRight { get; set; }
        public string UserMenuTypeNameLeft { get; set; }
        public string UserMenuTypeNameRight { get; set; }
        public string Name { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public string CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public string ModifiedDate { get; set; }
        public string UserId { get; set; }
    }
}

