using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreateGet
    {
        [Key]
        public int ContentTypeGroupId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int SecurityLevelId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Color { get; set; }
        public int IconId { get; set; }
        public string CreatorId { get; set; }
        public List<ContentTypeCreateGetClassification> ContentTypeClassifications { get; set; }
        public List<ContentTypeClassificationStatusList> ContentTypeClassificationStatuses { get; set; }
        public List<ContentTypeGroupList> ContentTypeGroups { get; set; }
        public List<ProcessTemplateList> ProcessTemplates { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<IconList> Icons { get; set; }
         
    }
}
