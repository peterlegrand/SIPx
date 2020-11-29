using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserMenuTemplateOptionIndexGet
    {
        [Key]
        public int UserMenuTemplateId { get; set; }
        public int UserMenuTemplateOptionId { get; set; }
        public int UserMenuTemplateOptionLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string Icon { get; set; }
        public int UserPageLeftId { get; set; }
        public int UserPageRightId { get; set; }
        public int Sequence { get; set; }
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
    }
}

