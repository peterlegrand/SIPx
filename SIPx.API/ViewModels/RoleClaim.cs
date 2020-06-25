using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class RoleClaim
    {
        [Key]
        public int ClaimID { get; set; }
        public int ClaimGroupID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public string GroupMenuName { get; set; }
        public string GroupMouseOver { get; set; }
    }
}
