using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentRightsEditUserIndexGet
    {
        [Key]
        public int ContentUserEditID { get; set; }
        public int ContentId { get; set; }
        public string SelectedUserId { get; set; }
        public string SelectedUserName { get; set; }
        public string DefaultOrganizationName { get; set; }
        public string UserId { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
