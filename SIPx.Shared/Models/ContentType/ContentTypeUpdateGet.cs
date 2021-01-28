using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeUpdateGet 
    {
        [Key]
        public int ContentTypeId { get; set; }
        public int ContentTypeGroupId { get; set; }
        public int ProcessTemplateId { get; set; }
        public string CodePrefix { get; set; }
        public string CodeSuffix { get; set; }
        public int CodeTypeId { get; set; }
        //public int ContentTypeLanguageId { get; set; }
        public int SecurityLevelId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public bool IsRelationBasedOwnership { get; set; }
        public bool IsProjectBasedOwnership { get; set; }
        public bool IsOrganizationBasedOwnership { get; set; }
        public bool IsFreeOwnership { get; set; }
        public bool IsRelationBasedEdit { get; set; }
        public bool IsRelationBasedEditSelectable { get; set; }
        public bool IsOrganizationBasedEdit { get; set; }
        public bool IsOrganizationBasedEditSelectable { get; set; }
        public bool IsOrganizationBasedEditSub { get; set; }
        public bool IsOrganizationBasedEditParent { get; set; }
        public bool IsProjectBasedEdit { get; set; }
        public bool IsProjectBasedEditSelectable { get; set; }
        public bool IsProjectBasedEditSub { get; set; }
        public bool IsProjectBasedEditParent { get; set; }
        public bool IsFreeEdit { get; set; }
        public bool IsFreeEditSelectable { get; set; }
        public bool IsRelationBasedRead { get; set; }
        public bool IsRelationBasedReadSelectable { get; set; }
        public bool IsOrganizationBasedRead { get; set; }
        public bool IsOrganizationBasedReadSelectable { get; set; }
        public bool IsOrganizationBasedReadSub { get; set; }
        public bool IsOrganizationBasedReadParent { get; set; }
        public bool IsProjectBasedRead { get; set; }
        public bool IsProjectBasedReadSelectable { get; set; }
        public bool IsProjectBasedReadSub { get; set; }
        public bool IsProjectBasedReadParent { get; set; }
        public bool IsFreeRead { get; set; }
        public bool IsFreeReadSelectable { get; set; }
        public List<ContentTypeCreateGetClassification> ContentTypeClassifications { get; set; }
        public List<ContentTypeClassificationStatusList> ContentTypeClassificationStatuses { get; set; }

        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<ProcessTemplateList> ProcessTemplates { get; set; }
        public List<ContentTypeGroupList> ContentTypeGroups { get; set; }
        public List<IconList> Icons { get; set; }
    }
}
