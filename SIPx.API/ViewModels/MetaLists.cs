using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class MetaListAddressType
    {
        [Key]
        public int AddressTypeId { get; set; }
        public string Name { get; set; }
    }

    public class MetaListClaim
    {
        [Key]
        public int ClaimId { get; set; }
        public string ClaimName { get; set; }
        public int ClaimGroupId { get; set; }
        public string ClaimGroupName { get; set; }
    }
    public class MetaListClaimGroup
    {
        [Key]
        public int ClaimGroupId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListContentStatus
    {
        [Key]
        public int ContentStatusId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListCountry
    {
        [Key]
        public int CountryId { get; set; }
        public string ForeingName { get; set; }
        public string ISO31662 { get; set; }
        public string ISO31663 { get; set; }
        public int ISO3166Num { get; set; }
        public string CountryName { get; set; }
        public int SubRegionId { get; set; }
        public string SubRegionName { get; set; }
        public int RegionId { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionId { get; set; }
        public string IntermediateRegionName { get; set; }
    }

    public class MetaListDateLevel
    {
        [Key]
        public int DateLevelId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListGender
    {
        [Key]
        public int GenderId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListLanguage
    {
        [Key]
        public int LanguageId { get; set; }
        public string ForeingName { get; set; }
        public string ISO6391 { get; set; }
        public string ISO6392 { get; set; }
        public string StatusName { get; set; }
        public string Name { get; set; }
    }
    public class MetaListRegion
    {
        [Key]
        public int RegionId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListSecurityLevel
    {
        [Key]
        public int SecurityLevelId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListSettings
    {
        [Key]
        public int SettingId { get; set; }
        public string Name { get; set; }
        public int IntValue { get; set; }
        public string StringValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public Guid GuidValue { get; set; }
    }

    public class MetaListSortBy
    {
        [Key]
        public int SortById { get; set; }
        public string Name { get; set; }
    }

    public class MetaListStatus
    {
        [Key]
        public int StatusId { get; set; }
        public string Name { get; set; }
    }

    public class MetaListSubRegion
    {
        [Key]
        public int SubRegionId { get; set; }
        public string SubRegionName { get; set; }
        public int RegionId { get; set; }
        public string RegionName { get; set; }
    }

    public class MetaListTelecomType
    {
        [Key]
        public int TelecomTypeId { get; set; }
        public string Name { get; set; }
    }

    public class MetaListValueUpdateType
    {
        [Key]
        public int ValueUpdateTypeId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListUITerm
    {
        [Key]
        public int UITermId { get; set; }
        public string InternalName { get; set; }
        public string Name { get; set; }
    }
    public class MetaListUITermCustomization
    {
        [Key]
        public int UITermId { get; set; }
        public string InternalName { get; set; }
        public string Customization { get; set; }
    }
    public class MetaListPageSectionDataType
    {
        [Key]
        public int PageSectionDataTypeId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListPageSectionType
    {
        [Key]
        public int PageSectionTypeId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListPreferenceType
    {
        [Key]
        public int PreferenceTypeId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateFieldType
    {
        [Key]
        public int ProcessTemplateFieldTypeId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateFlowConditionComparisonOperator
    {
        [Key]
        public int ProcessTemplateFlowConditionComparisonOperatorId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateFlowConditionType
    {
        [Key]
        public int ProcessTemplateFlowConditionTypeId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateStageFieldStatus
    {
        [Key]
        public int ProcessTemplateStageFieldStatuseId { get; set; }
        public string Name { get; set; }
    }
    public class MetaListClassification
    {
        [Key]
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string StatusName { get; set; }
        public string DefaultPage { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
    }

    public class MetaListClassificationLevel
    {
        [Key]
        public int ClassificationLevelId { get; set; }
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string DateLevelName { get; set; }
        public int Sequence { get; set; }
        public bool Alphabetically { get; set; }
        public bool OnTheFly { get; set; }
        public bool InDropDown { get; set; }
        public bool InMenu { get; set; }
    }

    public class MetaListClassificationPage
    {
        [Key]
        public int ClassificationPageId { get; set; }
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string StatusName { get; set; }
        public bool ShowTitleName { get; set; }
        public bool ShowTitleDescription { get; set; }
    }
    public class MetaListClassificationPageSection
    {
        [Key]
        public int ClassificationPageSectionId { get; set; }
        public int ClassificationPageId { get; set; }
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string PageSectionTypeName { get; set; }
        public string PageSectionDataTypeName { get; set; }
        public int Sequence { get; set; }
        public bool ShowSectionTitleName { get; set; }
        public bool ShowSectionTitleDescription { get; set; }
        public bool ShowContentTypeTitleName { get; set; }
        public bool ShowContentTypeTitleDescription { get; set; }
        public bool OneTwoColumns { get; set; }
    }
    public class MetaListClassificationUsers
    {
        [Key]
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string RelationTypeName { get; set; }
        public string OrganizatonName { get; set; }
    }


}
