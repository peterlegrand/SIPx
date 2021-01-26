using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentShowContentRights
    {

        [Key]
        public int ContentId { get; set; }
        public bool IsFreeEdit { get; set; }
        public bool IsFreeRead { get; set; }
        public bool IsRelationBasedEdit { get; set; }
        public bool IsRelationBasedRead { get; set; }
        public bool IsOrganizationBasedEdit { get; set; }
        public bool IsOrganizationBasedEditSub { get; set; }
        public bool IsOrganizationBasedEditParent { get; set; }
        public bool IsOrganizationBasedRead { get; set; }
        public bool IsOrganizationBasedReadSub { get; set; }
        public bool IsOrganizationBasedReadParent { get; set; }
        public bool IsProjectBasedEdit { get; set; }
        public bool IsProjectBasedEditSub { get; set; }
        public bool IsProjectBasedEditParent { get; set; }
        public bool IsProjectBasedRead { get; set; }
        public bool IsProjectBasedReadSub { get; set; }
        public bool IsProjectBasedReadParent { get; set; }
        public string OwnerId { get; set; }
        public bool IsFreeEditSelectable { get; set; }
        public bool IsFreeReadSelectable { get; set; }
        public bool IsRelationBasedEditSelectable { get; set; }
        public bool IsRelationBasedReadSelectable { get; set; }
        public bool IsOrganizationBasedEditSelectable { get; set; }
        public bool IsOrganizationBasedReadSelectable { get; set; }
        public bool IsProjectBasedEditSelectable { get; set; }
        public bool IsProjectBasedReadSelectable { get; set; }
       
    }
}
