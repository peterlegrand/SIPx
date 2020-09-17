using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessViewGetField
    {
        [Key]
        public int ProcessId { get; set; }
        public int ProcessFieldId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldTypeId { get; set; }
        public int ProcessTemplateStageId { get; set; }
        public int ProcessTemplateStageFieldStatusId { get; set; }
        public int ProcessTemplateStageTypeId { get; set; }
        public string ProcessTemplateFieldName { get; set; }
        public string ProcessTemplateStageTypeName { get; set; }
        public string StageTypeColor { get; set; }
        public string StageTypeIcon { get; set; }
        public string ProcessTemplateColor { get; set; }
        public string ProcessTemplateIcon { get; set; }
        public int IntValue { get; set; }
        public string StringValue { get; set; }
        public string DateTimeValue { get; set; }
        public string ControlProcessFieldId { get; set; }
        public string ControlProcessId { get; set; }
        public string ControlId { get; set; }
        public string ControlId1 { get; set; }
        public int PrimarySecondaryUserType { get; set; }
        public string PrimarySecondaryUserName { get; set; }
        public int PrimarySecondaryPersonType { get; set; }
        public string PrimarySecondaryPersonName { get; set; }
        public int PrimarySecondaryProjectType { get; set; }
        public string PrimarySecondaryProjectName { get; set; }
        public int PrimarySecondaryOrganizationType { get; set; }
        public string PrimarySecondaryOrganizationName { get; set; }
        public int PrimarySecondaryClassificationType { get; set; }
        public string PrimarySecondaryClassificationName { get; set; }
        public int PrimarySecondaryClassificationValueType { get; set; }
        public string PrimarySecondaryClassificationValueName { get; set; }
        public int PrimarySecondaryRoleType { get; set; }
        public string PrimarySecondaryRoleName { get; set; }
        public int PrimarySecondaryContentType { get; set; }
        public string PrimarySecondaryContentTitle { get; set; }
        public int PrimarySecondaryLanguageType { get; set; }
        public string PrimarySecondaryLanguageName { get; set; }
        public int PrimarySecondaryCountryType { get; set; }
        public string PrimarySecondaryCountryName { get; set; }
        public int PrimarySecondarySecurityLevelType { get; set; }
        public string PrimarySecondarySecurityLevelName { get; set; }

    }
}
