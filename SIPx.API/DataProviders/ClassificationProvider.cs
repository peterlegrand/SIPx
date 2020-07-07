
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
            string usp = "usp_Classifications @UserID";
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
            var x = await _sqlDataAccess.LoadData<ClassificationCreateGetSequence, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ClassificationUpdateGet> GetClassification(string UserId, int ClassificationId)
        {
            string usp = "usp_Classification @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationUpdateGet> GetClassificationEdit(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUpdateView @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public async Task<List<ClassificationLanguageUpdateGet>> GetClassificationLanguages(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLanguages @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public Task<ClassificationLanguageUpdateGet> GetClassificationLanguage(string UserId, int ClassificationLanguageId)
        {
            string usp = "usp_ClassificationLanguage @UserId, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationLanguageId = ClassificationLanguageId });

        }
        public async Task<List<ClassificationLevelIndexGet>> GetClassificationLevels(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevels @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelIndexGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public Task<ClassificationLevelUpdateGet> GetClassificationLevel(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevel @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationLevelId = ClassificationLevelId });

        }
        public async Task<List<ClassificationLevelLanguageIndex>> GetClassificationLevelLanguages(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelLanguages @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelLanguageIndex, dynamic>(usp, new { UserId = UserId, ClassificationLevelId = ClassificationLevelId });
            return x;
        }
        public Task<ClassificationLevelLanguageIndex> GetClassificationLevelLanguage(string UserId, int ClassificationLevelLanguageId)
        {
            string usp = "usp_ClassificationLevelLanguage @UserId, @ClassificationLevelLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelLanguageIndex, dynamic>(usp, new { UserId = UserId, ClassificationLevelLanguageId = ClassificationLevelLanguageId });

        }
        public Task<List<ClassificationPageList>> GetClassificationPageList(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPageList @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationPageList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public async Task<List<ClassificationPageIndexGet>> GetClassificationPages(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPages @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationPageIndexGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public Task<ClassificationPageUpdateGet> GetClassificationPage(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPage @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationPageId = ClassificationPageId });

        }
        public Task<List<ClassificationPageLanguageIndex>> GetClassificationPageLanguages(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageLanguages @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageLanguageIndex, dynamic>(usp, new { UserId = UserId, ClassificationPageId = ClassificationPageId });

        }
        public Task<ClassificationPageLanguageIndex> GetClassificationPageLanguage(string UserId, int ClassificationPageLanguageId)
        {
            string usp = "usp_ClassificationPageLanguage @UserId, @ClassificationPageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageLanguageIndex, dynamic>(usp, new { UserId = UserId, ClassificationPageLanguageId = ClassificationPageLanguageId });

        }
        public Task<List<ClassificationPageSectionUpdateGet>> GetClassificationPageSections(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageSections @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationPageId = ClassificationPageId });

        }
        public Task<ClassificationPageSectionUpdateGet> GetClassificationPageSection(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSection @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationPageSectionId = ClassificationPageSectionId });

        }
        public Task<List<ClassificationPageSectionLanguageUpdateGet>> GetClassificationPageSectionLanguages(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionLanguages @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationPageSectionId = ClassificationPageSectionId });

        }
        public Task<ClassificationPageSectionLanguageUpdateGet> GetClassificationPageSectionLanguage(string UserId, int ClassificationPageSectionLanguageId)
        {
            string usp = "usp_ClassificationPageSectionLanguage @UserId, @ClassificationPageLanguageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationPageSectionLanguageId = ClassificationPageSectionLanguageId });

        }
        public Task<List<ClassificationRelationTypeIndexGet>> GetClassificationRelationTypes(string UserId)
        {
            string usp = "usp_ClassificationRelationTypes @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ClassificationRelationTypeUpdateGet> GetClassificationRelationType(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationType @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationRelationTypeId = ClassificationRelationTypeId });

        }
        public Task<List<ClassificationRelationTypeLanguageUpdateGet>> GetClassificationRelationTypeLanguages(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeLanguages @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationRelationTypeId = ClassificationRelationTypeId });

        }
        public Task<ClassificationRelationTypeLanguageUpdateGet> GetClassificationRelationTypeLanguage(string UserId, int ClassificationRelationTypeLanguageId)
        {
            string usp = "usp_ClassificationRelationTypeLanguage @UserId, @ClassificationPageLanguageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationRelationTypeLanguageId = ClassificationRelationTypeLanguageId });

        }
        public Task<List<ClassificationRoleUpdateGet>> GetClassificationRoles(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationRoles @UserId, ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationRoleUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationRoleUpdateGet> GetClassificationRole(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRole @UserId, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRoleUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationRoleId = ClassificationRoleId });

        }
        public Task<List<ClassificationUserUpdateGet>> GetClassificationUsers(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUsers @UserId, ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationUserUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationUserUpdateGet> GetClassificationUser(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUser @UserId, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUserUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationUserId = ClassificationUserId });

        }
        public Task<List<ClassificationValueRoleUpdateGet>> GetClassificationValueRoles(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueRoles @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationValueRoleUpdateGet> GetClassificationValueRole(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRole @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRoleUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationValueRoleId = ClassificationValueRoleId });

        }
        public Task<List<ClassificationValueUserUpdateGet>> GetClassificationValueUsers(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueUsers @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationValueUserUpdateGet> GetClassificationValueUser(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUser @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUserUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationValueUserId = ClassificationValueUserId });

        }
        public Task<List<ClassificationValueUpdateGet>> GetClassificationValues(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValues @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUpdateGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public bool PostClassification(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreate @StatusId, @HasDropDown, @DropDownSequence, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }
        public async Task<string> PostClassificationCheck(ClassificationCreatePost Classification)
        {
            string usp = "usp_ClassificationCreateCheck @StatusId  , @HasDropDown , @DropDownSequence , @LanguageId , @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }
        public bool PutClassification(ClassificationUpdatePut Classification)
        {
            string usp = "usp_ClassificationUpdate @classificationLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @ModifierId ";
            _sqlDataAccess.SaveData<ClassificationUpdatePut>(usp, Classification);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.
        public async Task<string> PutClassificationCheck(ClassificationUpdatePut Classification)
        {
            string usp = "usp_ClassificationUpdateCheck @classificationLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @ModifierId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }
    }
}
