using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectCreatePost : IProjectCreatePost
    {
        [Key]
        public int ProjectParentId { get; set; }
        public int StatusId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserID { get; set; }
    }
}
