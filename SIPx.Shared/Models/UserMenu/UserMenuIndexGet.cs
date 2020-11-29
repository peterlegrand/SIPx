using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuIndexGet
    {
        [Key]
        public int UserMenuId { get; set; }
        public string Name { get; set; }
        public string IconName{ get; set; }
        public int UserPageLeftId { get; set; }
        public string LeftMenuTypeName { get; set; }
        public string LeftPageName { get; set; }
        public int UserPageRightId { get; set; }
        public string RightMenuTypeName { get; set; }
        public string RightPageName { get; set; }
        public int Sequence { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}

