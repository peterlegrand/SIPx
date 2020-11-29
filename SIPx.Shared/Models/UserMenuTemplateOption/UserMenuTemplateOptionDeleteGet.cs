using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuTemplateOptionDeleteGet
    {

        public int UserMenuTemplateOptionId { get; set; }
        public int UserMenuTemplateId { get; set; }
        public string IconName { get; set; }
        public string UserPageLeftName { get; set; }
        public string UserPageRightName { get; set; }
        public string UserTypeLeftName { get; set; }
        public string UserTypeRightName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

    }
}

