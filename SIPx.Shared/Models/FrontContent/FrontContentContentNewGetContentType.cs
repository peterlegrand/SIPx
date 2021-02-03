using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentNewGetContentType
    {
        [Key]
        public int SecurityLevelID { get; set; }
        public string CodePrefix { get; set; }

        public string CodeSuffix { get; set; }
        public int CodeTypeId { get; set; }
        public bool IsRelationBasedEdit { get; set; }
        public bool IsRelationBasedEditSelectable { get; set; }
        public bool IsRelationBasedRead { get; set; }
        public bool IsRelationBasedReadSelectable { get; set; }
        public bool IsFreeEdit { get; set; }

        public bool IsFreeEditSelectable { get; set; }

        public bool IsFreeRead { get; set; }

        public bool IsFreeReadSelectable { get; set; }

        public bool IsOrganizationBasedEdit { get; set; }

        public bool IsOrganizationBasedEditParent { get; set; }
        public bool IsOrganizationBasedEditSub { get; set; }

        public bool IsOrganizationBasedEditSelectable { get; set; }

        public bool IsOrganizationBasedRead { get; set; }

        public bool IsOrganizationBasedReadParent { get; set; }

        public bool IsOrganizationBasedReadSub { get; set; }

        public bool IsOrganizationBasedReadSelectable { get; set; }


    }
}
