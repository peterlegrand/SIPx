using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentRightsReadUserCreateGet
    {
        [Key]
        public int ContentId { get; set; }
        public string SelectedUserId { get; set; }
        public string UserId { get; set; }
        public List<UserList> SelectedUsers { get; set; }

    }
}
