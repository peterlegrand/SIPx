using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationCreatePost : IOrganizationCreatePost
    {
        [Key]
        public int OrganizationTypeID { get; set; }
        public int? ParentOrganizationID { get; set; }
        public int StatusID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
    }
}
