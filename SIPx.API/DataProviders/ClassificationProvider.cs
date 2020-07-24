
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ClassificationProvider : IClassificationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<ClassificationIndexGet>> ClassificationIndexGet(string UserId)
        {
            string usp = "usp_ClassificationIndexGet @UserID";
            List<ClassificationIndexGet> x = await _sqlDataAccess.LoadData<ClassificationIndexGet, dynamic>(usp, new { UserId });
            return x;
        }
        //public async Task<List<ClassificationCreateGet>> ClassificationCreateGet(string UserId)
        //{
        //    string usp = "usp_Classifications @UserID";
        //    var x = await _sqlDataAccess.LoadData<ClassificationIndexGet, dynamic>(usp, new { UserId = UserId });
        //    return x;
        //}
        public async Task<List<ClassificationCreateGetSequence>> ClassificationCreateGetSequence(string UserId)
        {
            string usp = "usp_ClassificationCreateGetSequence @UserID";
            var x = await _sqlDataAccess.LoadData<ClassificationCreateGetSequence, dynamic>(usp, new { UserId });
            return x;
        }
        //public Task<ClassificationUpdateGet> ClassificationUpdateGet(string UserId, int ClassificationId)
        //{
        //    string usp = "usp_ClassificationUpdateGet @UserId, @classificationID";
        //    return _sqlDataAccess.LoadSingleRecord<ClassificationUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        //}
        public Task<ClassificationUpdateGet> ClassificationUpdateGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUpdateGet @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public async Task<List<ClassificationLanguageIndexGet>> ClassificationLanguageIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLanguageIndexGet @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }
        public Task<ClassificationLanguageIndexGet> ClassificationLanguageUpdateGet(string UserId, int ClassificationLanguageId)
        {
            string usp = "usp_ClassificationLanguageUpdateGet @UserId, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLanguageId });

        }
        public async Task<List<ClassificationLevelIndexGet>> ClassificationLevelIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevelIndex @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }
        public Task<ClassificationLevelUpdateGet> ClassificationLevelUpdateGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelUpdateGet @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelUpdateGet, dynamic>(usp, new { UserId, ClassificationLevelId });

        }
        public async Task<List<ClassificationLevelLanguageIndexGet>> ClassificationLevelLanguageIndexGet(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelLanguageIndex @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelId });
            return x;
        }
        public Task<ClassificationLevelLanguageIndexGet> ClassificationLevelLanguageUpdateGet(string UserId, int ClassificationLevelLanguageId)
        {
            string usp = "usp_ClassificationLevelLanguageUpdateGet @UserId, @ClassificationLevelLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationLevelLanguageId });

        }
        public async Task<List<ClassificationValueLanguageIndexGet>> ClassificationValueLanguageIndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueLanguageIndex @UserId, @ClassificationValueID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });
            return x;
        }
        public Task<ClassificationValueLanguageIndexGet> ClassificationValueLanguageUpdateGet(string UserId, int ClassificationValueLanguageId)
        {
            string usp = "usp_ClassificationValueLanguageUpdateGet @UserId, @ClassificationValueLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueLanguageId });

        }

        public Task<List<ClassificationPageList>> ClassificationPageListGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPageList @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationPageList, dynamic>(usp, new { UserId, ClassificationId });

        }


        public async Task<List<ClassificationPageIndexGet>> ClassificationPageIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPageIndexGet @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationPageIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }
        //public async Task<List<ClassificationPageSectionIndexGet>> ClassificationPageSectionIndexGet(string UserId, int ClassificationPageId)
        //{
        //    string usp = "usp_ClassificationPageSections @UserId, @ClassificationPageID";
        //    var x = await _sqlDataAccess.LoadData<ClassificationPageSectionIndexGet, dynamic>(usp, new { UserId, ClassificationPageId });
        //    return x;

        //}
        public Task<ClassificationPageUpdateGet> ClassificationPageUpdateGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageUpdateGet @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageUpdateGet, dynamic>(usp, new { UserId, ClassificationPageId });

        }
        public Task<List<ClassificationPageLanguageIndexGet>> ClassificationPageLanguageIndexGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageLanguageIndexGet @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageId });

        }
        public Task<ClassificationPageLanguageIndexGet> GetClassificationPageLanguageUpdateGet(string UserId, int ClassificationPageLanguageId)
        {
            string usp = "usp_ClassificationPageLanguageUpdateGet @UserId, @ClassificationPageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageLanguageId });

        }
        public async Task<List<ClassificationPageSectionIndexGet>> ClassificationPageSectionIndexGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageSectionIndexGet @UserId, @ClassificationPageID";
            var x = await _sqlDataAccess.LoadData<ClassificationPageSectionIndexGet, dynamic>(usp, new { UserId, ClassificationPageId });
            return x;

        }

        public Task<ClassificationPageSectionUpdateGet> ClassificationPageSectionUpdateGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionUpdateGet @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionUpdateGet, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }
        public Task<List<ClassificationPageSectionLanguageIndexGet>> ClassificationPageSectionLanguageIndexGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionLanguageIndexGet @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }
        public Task<ClassificationPageSectionLanguageIndexGet> ClassificationPageSectionLanguageUpdateGet(string UserId, int ClassificationPageSectionLanguageId)
        {
            string usp = "usp_ClassificationPageSectionLanguageUpdateGet @UserId, @ClassificationPageSectionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageSectionLanguageId });

        }
        public Task<List<ClassificationRelationTypeIndexGet>> ClassificationRelationTypeIndexGet(string UserId)
        {
            string usp = "usp_ClassificationRelationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeIndexGet, dynamic>(usp, new { UserId });

        }
        public Task<ClassificationRelationTypeUpdateGet> ClassificationRelationTypeUpdateGet(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeUpdateGet @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeUpdateGet, dynamic>(usp, new { UserId, ClassificationRelationTypeId });

        }
        public Task<List<ClassificationRelationTypeLanguageUpdateGet>> ClassificationRelationTypeLanguageIndexGet(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeLanguageIndexGet @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeLanguageUpdateGet, dynamic>(usp, new { UserId, ClassificationRelationTypeId });

        }
        public Task<ClassificationPageLanguageUpdateGet> ClassificationRelationTypeLanguageUpdateGet(string UserId, int ClassificationRelationTypeLanguageId)
        {
            string usp = "usp_ClassificationRelationTypeLanguageUpdateGet @UserId, @ClassificationRelationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageLanguageUpdateGet, dynamic>(usp, new { UserId, ClassificationRelationTypeLanguageId });

        }
        public Task<List<ClassificationRoleIndexGet>> ClassificationRoleIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationRoleIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationRoleIndexGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationRoleUpdateGet> ClassificationRoleUpdateGet(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRoleUpdateGet @UserId, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationRoleId });

        }
        public Task<List<ClassificationUserIndexGet>> ClassificationUserIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUserIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationUserIndexGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationUserUpdateGet> ClassificationUserUpdateGet(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUserUpdateGet @UserId, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUserUpdateGet, dynamic>(usp, new { UserId, ClassificationUserId });

        }
        public Task<List<ClassificationValueRoleUpdateGet>> ClassificationValueRoleIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueRoleIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationValueRoleUpdateGet> ClassificationValueRoleUpdateGet(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRoleUpdateGet @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId, ClassificationValueRoleId });

        }
        public Task<List<ClassificationValueUserUpdateGet>> ClassificationValueUserIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueUserIndex @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public Task<ClassificationValueUserUpdateGet> ClassificationValueUserUpdateGet(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUserUpdateGet @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId, ClassificationValueUserId });

        }
        public Task<ClassificationValueUpdateGet> ClassificationValueUpdateGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueUpdateGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationValueId });

        }
        public Task<List<ClassificationValueUpdateGet>> ClassificationValueIndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        public bool ClassificationCreatePost(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreatePost @StatusId, @HasDropDown, @DropDownSequence, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }
        public bool ClassificationLevelCreatePost(ClassificationLevelCreatePost ClassificationLevel)
        {
            string usp = "usp_classificationLevelCreatePost @ClassificationId, @Sequence, @DateLevelId, @OnTheFly, @Alhpabetically, @CanLink, @InDropDown, @InMenu,  @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationLevelCreatePost>(usp, ClassificationLevel);
            return true;
        }
        public bool ClassificationRelationTypeCreatePost(ClassificationRelationTypeCreatePost ClassificationRelationType)
        {
            string usp = "usp_ClassificationRelationTypeCreatePost @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationRelationTypeCreatePost>(usp, ClassificationRelationType);
            return true;
        }
        public bool ClassificationRoleCreatePost(ClassificationRoleCreatePost ClassificationRole)
        {
            string usp = "usp_ClassificationRoleCreatePost @RoleId, @ClassificationId, @ClassificationRelationTypeId, @UserID";
            _sqlDataAccess.SaveData<ClassificationRoleCreatePost>(usp, ClassificationRole);
            return true;
        }
        public bool ClassificationPageCreatePost(ClassificationPageCreatePost ClassificationPage)
        {
            string usp = "usp_ClassificationPageCreatePost @ClassificationId,@StatusId, @ShowTitleName, @ShowTitleDescription, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId ";
            _sqlDataAccess.SaveData<ClassificationPageCreatePost>(usp, ClassificationPage);
            return true;
        }
        public bool ClassificationPageSectionCreatePost(ClassificationPageSectionCreatePost ClassificationPageSection)
        {
            string usp = "usp_ClassificationPageSectionCreatePost @ClassificationPageId, @ClassificationId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @OneTwoColumns, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId ";
            _sqlDataAccess.SaveData<ClassificationPageSectionCreatePost>(usp, ClassificationPageSection);
            return true;
        }
        public Task<List<SequenceList>> ClassificationLevelCreateGetSequence(string UserId, int ClassificationId)
        {
            string usp = "[usp_ClassificationLevelCreateGetSequence] @UserID, @ClassificationId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ClassificationId });
        }
        public Task<List<LanguageList>> ClassificationLangugageCreateGetLanguageList(string UserId, int ClassificationId)
        {
            string usp = "[usp_ClassificationLangugageCreateGetLanguageList] @UserID, @ClassificationId";
            return _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId, ClassificationId });
        }
        public Task<List<SequenceList>> ClassificationPageSectionCreateGetSequence(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageSectionCreateGetSequence @UserID, @ClassificationPageId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ClassificationPageId });
        }
        public Task<List<ClassificationRelationTypeList>> ClassificationRelationTypeList(string UserId)
        {
            string usp = "usp_ClassificationRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeList, dynamic>(usp, new { UserId });
        }
        public async Task<string> ClassificationCreatePostCheck(ClassificationCreatePost Classification)
        {
            string usp = "usp_ClassificationCreatePostCheck @StatusId  , @HasDropDown , @DropDownSequence , @LanguageId , @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }
        public async Task<string> ClassificationLevelCreatePostCheck(ClassificationLevelCreatePost ClassificationLevel)
        {
            string usp = "usp_ClassificationLevelCreatePostCheck @ClassificationId  , @Sequence , @LanguageId , @Name, @DateLevelId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationLevel);
            return CheckString;
        }
        public async Task<string> ClassificationValueCreatePostCheck(ClassificationValueCreatePost ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePostCheck @Classification, @Parent, @LanguageId , @Name";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValue);
            return CheckString;
        }
        public async Task<string> ClassificationValueCreatePost(ClassificationValueCreatePost ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePost @ClassificationId, @ParentId, @DateFrom, @DateTo, @Location, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValue);
            return String;
        }
        public async Task<string> ClassificationPageCreatePostCheck(ClassificationPageCreatePost ClassificationPage)
        {
            string usp = "usp_ClassificationPageCreatePostCheck @ClassificationId, @StatusId, @LanguageId , @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationPage);
            return CheckString;
        }
        public async Task<string> ClassificationPageSectionCreatePostCheck(ClassificationPageSectionCreatePost ClassificationPageSection)
        {
            string usp = "usp_ClassificationPageSectionCreatePostCheck @ClassificationPageId, @Sequence, @PageSectionTypeId, @PageSectionDateTypeId, @ContentTypeId, @SortById , @OneTwoColumns , @LanguageId , @Name";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationPageSection);
            return CheckString;
        }
        public async Task<string> ClassificationRelationTypeCreatePostCheck(ClassificationRelationTypeCreatePost ClassificationRelationType)
        {
            string usp = "usp_ClassificationRelationTypeCreatePostCheck @LanguageId , @Name";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationRelationType);
            return CheckString;
        }
        public async Task<string> ClassificationValueRoleCreatePostCheck(ClassificationValueRoleCreatePost ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePostCheck @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return CheckString;
        }
        public async Task<string> ClassificationValueRoleCreatePost(ClassificationValueRoleCreatePost ClassificationValueRole)
        {
            string usp = "usp_ClassificationValueRoleCreatePost @RoleId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueRole);
            return String;
        }
        public async Task<string> ClassificationValueUserCreatePostCheck(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePostCheck @UserId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return CheckString;
        }
        public async Task<string> ClassificationValueUserCreatePost(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            string usp = "usp_ClassificationValueUserCreatePost @UserId, @ClassificationValueId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueUser);
            return String;
        }

        public async Task<string> ClassificationRoleCreatePostCheck(ClassificationRoleCreatePost ClassificationRole)
        {
            string usp = "usp_ClassificationRoleCreatePostCheck @RoleId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationRole);
            return CheckString;
        }
        public async Task<string> ClassificationUserCreatePost(ClassificationUserCreatePost ClassificationUser)
        {
            string usp = "usp_ClassificationUserCreatePost @UserId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationUser);
            return String;
        }
        public async Task<string> ClassificationUserCreatePostCheck(ClassificationUserCreatePost ClassificationUser)
        {
            string usp = "usp_ClassificationUserCreatePostCheck @UserId, @ClassificationId , @ClassificationRelationTypeId, CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationUser);
            return CheckString;
        }
        public bool PutClassification(ClassificationUpdatePut Classification)
        {
            string usp = "usp_ClassificationUpdate @classificationLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @ModifierId ";
            _sqlDataAccess.SaveData<ClassificationUpdatePut>(usp, Classification);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.
        public async Task<string> ClassificationCheckPut(ClassificationUpdatePut Classification)
        {
            string usp = "usp_ClassificationUpdateCheck @classificationLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @ModifierId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }
        public Task<List<ClassificationPageSectionSequenceList>> ClassificationPageSectionSequenceListBySectionIdGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionSequenceList @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionSequenceList, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }
        public Task<List<ClassificationRelationTypeList>> ClassificationRelationTypeListGet(string UserId)
        {
            string usp = "usp_ClassificationRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
