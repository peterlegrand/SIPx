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
        public int AddressTypeID { get; set; }
        public string Name { get; set; }
    }

    public class MetaListClaim
    {
        [Key]
        public int ClaimID { get; set; }
        public string ClaimName { get; set; }
        public int ClaimGroupID { get; set; }
        public string ClaimGroupName { get; set; }
    }
    public class MetaListClaimGroup
    {
        [Key]
        public int ClaimGroupID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListContentStatus
    {
        [Key]
        public int ContentStatusID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListCountry
    {
        [Key]
        public int CountryID { get; set; }
        public string ForeingName { get; set; }
        public string ISO31662 { get; set; }
        public string ISO31663 { get; set; }
        public int ISO3166Num { get; set; }
        public string CountryName { get; set; }
        public int SubRegionID { get; set; }
        public string SubRegionName { get; set; }
        public int RegionID { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionID { get; set; }
        public string IntermediateRegionName { get; set; }
    }

    public class MetaListDateLevel
    {
        [Key]
        public int DateLevelID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListGender
    {
        [Key]
        public int GenderID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListLanguage
    {
        [Key]
        public int LanguageID { get; set; }
        public string ForeingName { get; set; }
        public string ISO6391 { get; set; }
        public string ISO6392 { get; set; }
        public string StatusName { get; set; }
        public string Name { get; set; }
    }
    public class MetaListRegion
    {
        [Key]
        public int RegionID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListSecurityLevel
    {
        [Key]
        public int SecurityLevelID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListSettings
    {
        [Key]
        public int SettingID { get; set; }
        public string Name { get; set; }
        public int IntValue { get; set; }
        public string StringValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public Guid GuidValue { get; set; }
    }

    public class MetaListSortBy
    {
        [Key]
        public int SortByID { get; set; }
        public string Name { get; set; }
    }

    public class MetaListStatus
    {
        [Key]
        public int StatusID { get; set; }
        public string Name { get; set; }
    }

    public class MetaListSubRegion
    {
        [Key]
        public int SubRegionID { get; set; }
        public string SubRegionName { get; set; }
        public int RegionID { get; set; }
        public string RegionName { get; set; }
    }

    public class MetaListTelecomType
    {
        [Key]
        public int TelecomTypeID { get; set; }
        public string Name { get; set; }
    }

    public class MetaListValueUpdateType
    {
        [Key]
        public int ValueUpdateTypeID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListUITerm
    {
        [Key]
        public int UITermID { get; set; }
        public string InternalName { get; set; }
        public string Name { get; set; }
    }
    public class MetaListUITermCustomization
    {
        [Key]
        public int UITermID { get; set; }
        public string InternalName { get; set; }
        public string Customization { get; set; }
    }
    public class MetaListPageSectionDataType
    {
        [Key]
        public int PageSectionDataTypeID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListPageSectionType
    {
        [Key]
        public int PageSectionTypeID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListPreferenceType
    {
        [Key]
        public int PreferenceTypeID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateFieldType
    {
        [Key]
        public int ProcessTemplateFieldTypeID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateFlowConditionComparisonOperator
    {
        [Key]
        public int ProcessTemplateFlowConditionComparisonOperatorID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateFlowConditionType
    {
        [Key]
        public int ProcessTemplateFlowConditionTypeID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListProcessTemplateStageFieldStatus
    {
        [Key]
        public int ProcessTemplateStageFieldStatuseID { get; set; }
        public string Name { get; set; }
    }
    public class MetaListClassification
    {
        [Key]
        public int ClassificationID { get; set; }
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
        public int ClassificationLevelID { get; set; }
        public int ClassificationID { get; set; }
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
        public int ClassificationPageID { get; set; }
        public int ClassificationID { get; set; }
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
        public int ClassificationPageSectionID { get; set; }
        public int ClassificationPageID { get; set; }
        public int ClassificationID { get; set; }
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
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string RelationTypeName { get; set; }
        public string OrganizatonName { get; set; }
    }


}
