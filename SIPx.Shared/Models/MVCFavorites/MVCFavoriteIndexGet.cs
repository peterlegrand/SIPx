using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteIndexGet
    {
        [Key]
        public int MVCFavoriteId { get; set; }
        public string Name { get; set; }
        public int MVCFavoriteGroupId { get; set; }
        public string MVCFavoriteGroupName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
