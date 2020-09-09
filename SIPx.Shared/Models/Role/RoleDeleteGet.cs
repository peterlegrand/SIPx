using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class RoleDeleteGet
    {
        [Key]
        public string RoleId { get; set; }
        public string InternalName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string GroupName { get; set; }

        //public string CreatorId { get; set; }
        //public string CreatorName { get; set; }
        //public DateTime CreatedDate { get; set; }
        //public string ModifierId { get; set; }
        //public string ModifierName { get; set; }
        //public DateTime ModifiedDate { get; set; }

    }
}
