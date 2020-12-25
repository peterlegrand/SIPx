using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentRightsUpdateGet
    {
        [Key]
        public int ContentId { get; set; }
        public bool IsRelationBasedOwnership { get; set; }
        public bool IsProjectBasedOwnership { get; set; }
        public bool IsOrganizationBasedOwnership { get; set; }
        public bool IsFreeOwnership { get; set; }

        public bool IsRelationBasedEditSelectable { get; set; }
        public bool IsProjectBasedEditSelectable { get; set; }
        public bool IsOrganizationBasedEditSelectable { get; set; }
        public bool IsFreeEditSelectable { get; set; }


        public bool IsRelationBasedReadSelectable { get; set; }
        public bool IsProjectBasedReadSelectable { get; set; }
        public bool IsOrganizationBasedReadSelectable { get; set; }
        public bool IsFreeReadSelectable { get; set; }


        public bool DefaultIsRelationBasedEdit { get; set; }
        public bool DefaultIsProjectBasedEdit { get; set; }
        public bool DefaultIsProjectBasedEditSub { get; set; }
        public bool DefaultIsProjectBasedEditParent { get; set; }
        public bool DefaultIsOrganizationBasedEdit { get; set; }
        public bool DefaultIsOrganizationBasedEditSub { get; set; }
        public bool DefaultIsOrganizationBasedEditParent { get; set; }
        public bool DefaultIsFreeEdit { get; set; }

        public bool DefaultIsRelationBasedRead { get; set; }
        public bool DefaultIsProjectBasedRead { get; set; }
        public bool DefaultIsProjectBasedReadSub { get; set; }
        public bool DefaultIsProjectBasedReadParent { get; set; }
        public bool DefaultIsOrganizationBasedRead { get; set; }
        public bool DefaultIsOrganizationBasedReadSub { get; set; }
        public bool DefaultIsOrganizationBasedReadParent { get; set; }
        public bool DefaultIsFreeRead { get; set; }



        public bool IsRelationBasedEdit { get; set; }
        public bool IsRelationBasedRead { get; set; }
        public bool IsProjectBasedEdit { get; set; }
        public bool IsProjectBasedEditSub { get; set; }
        public bool IsProjectBasedEditParent { get; set; }
        public bool IsOrganizationBasedEdit { get; set; }
        public bool IsOrganizationBasedEditSub { get; set; }
        public bool IsOrganizationBasedEditParent { get; set; }
        public bool IsFreeEdit { get; set; }
        public bool IsProjectBasedRead { get; set; }
        public bool IsProjectBasedReadSub { get; set; }
        public bool IsProjectBasedReadParent { get; set; }
        public bool IsOrganizationBasedRead { get; set; }
        public bool IsOrganizationBasedReadSub { get; set; }
        public bool IsOrganizationBasedReadParent { get; set; }
        public bool IsFreeRead { get; set; }

        public string OwnerId { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public List<UserList> Owners { get; set; }
    }
}
