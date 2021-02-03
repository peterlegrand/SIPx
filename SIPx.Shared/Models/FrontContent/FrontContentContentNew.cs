﻿using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentNew
    {
        [Key]
        public int ContentTypeId { get; set; }
        public int NewId { get; set; }
        public int ContentStatusId { get; set; }
        public int LanguageId { get; set; }

        public string ContentTypeName { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int SecurityLevelId { get; set; }
        public int OrganizationId { get; set; }
        public int ProjectId { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UserId { get; set; }
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



        public bool IsProjectBasedEdit { get; set; }

        public bool IsProjectBasedEditParent { get; set; }
        public bool IsProjectBasedEditSub { get; set; }

        public bool IsProjectBasedEditSelectable { get; set; }

        public bool IsProjectBasedRead { get; set; }

        public bool IsProjectBasedReadParent { get; set; }

        public bool IsProjectBasedReadSub { get; set; }

        public bool IsProjectBasedReadSelectable { get; set; }


        public List<FrontContentContentNewClassification> Classifications { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<ContentStatusList> ContentStatuses { get; set; }
        public List<LanguageList> Languages { get; set; }
    }
}
