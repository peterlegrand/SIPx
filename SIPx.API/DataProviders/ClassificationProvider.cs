
using Dapper;
using SIPx.API.ViewModels;
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
        public async Task<List<Classification>> GetClassifications(string UserId)
        {
            string usp = "usp_Classifications @UserID";
            var x = await _sqlDataAccess.LoadData<Classification, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Classification> GetClassification(string UserId, int ClassificationId)
        {
            string usp = "usp_Classification @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<Classification, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationEditGet> GetClassificationEdit(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUpdateView @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationEditGet, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public async Task<List<ClassificationLanguage>> GetClassificationLanguages(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLanguages @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLanguage, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public Task<ClassificationLanguage> GetClassificationLanguage(string UserId, int ClassificationLanguageId)
        {
            string usp = "usp_ClassificationLanguage @UserId, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLanguage, dynamic>(usp, new { UserId = UserId, ClassificationLanguageId = ClassificationLanguageId });

        }
        public async Task<List<ClassificationLevel>> GetClassificationLevels(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevels @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevel, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public Task<ClassificationLevel> GetClassificationLevel(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevel @UserId, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevel, dynamic>(usp, new { UserId = UserId, ClassificationLevelId = ClassificationLevelId });

        }
        public async Task<List<ClassificationLevelLanguage>> GetClassificationLevelLanguages(string UserId, int ClassificationLevelId)
        {
            string usp = "usp_ClassificationLevelLanguages @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelLanguage, dynamic>(usp, new { UserId = UserId, ClassificationLevelId = ClassificationLevelId });
            return x;
        }
        public Task<ClassificationLevelLanguage> GetClassificationLevelLanguage(string UserId, int ClassificationLevelLanguageId)
        {
            string usp = "usp_ClassificationLevelLanguage @UserId, @ClassificationLevelLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelLanguage, dynamic>(usp, new { UserId = UserId, ClassificationLevelLanguageId = ClassificationLevelLanguageId });

        }
        public Task<List<ClassificationPageList>> GetClassificationPageList(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPageList @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationPageList, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public async Task<List<ClassificationPage>> GetClassificationPages(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPages @UserId, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationPage, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }
        public Task<ClassificationPage> GetClassificationPage(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPage @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPage, dynamic>(usp, new { UserId = UserId, ClassificationPageId = ClassificationPageId });

        }
        public Task<List<ClassificationPageLanguage>> GetClassificationPageLanguages(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageLanguages @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageLanguage, dynamic>(usp, new { UserId = UserId, ClassificationPageId = ClassificationPageId });

        }
        public Task<ClassificationPageLanguage> GetClassificationPageLanguage(string UserId, int ClassificationPageLanguageId)
        {
            string usp = "usp_ClassificationPageLanguage @UserId, @ClassificationPageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageLanguage, dynamic>(usp, new { UserId = UserId, ClassificationPageLanguageId = ClassificationPageLanguageId });

        }
        public Task<List<ClassificationPageSection>> GetClassificationPageSections(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageSections @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageSection, dynamic>(usp, new { UserId = UserId, ClassificationPageId = ClassificationPageId });

        }
        public Task<ClassificationPageSection> GetClassificationPageSection(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSection @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSection, dynamic>(usp, new { UserId = UserId, ClassificationPageSectionId = ClassificationPageSectionId });

        }
        public Task<List<ClassificationPageSectionLanguage>> GetClassificationPageSectionLanguages(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionLanguages @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionLanguage, dynamic>(usp, new { UserId = UserId, ClassificationPageSectionId = ClassificationPageSectionId });

        }
        public Task<ClassificationPageSectionLanguage> GetClassificationPageSectionLanguage(string UserId, int ClassificationPageSectionLanguageId)
        {
            string usp = "usp_ClassificationPageSectionLanguage @UserId, @ClassificationPageLanguageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionLanguage, dynamic>(usp, new { UserId = UserId, ClassificationPageSectionLanguageId = ClassificationPageSectionLanguageId });

        }
        public Task<List<ClassificationRelationType>> GetClassificationRelationTypes(string UserId)
        {
            string usp = "usp_ClassificationRelationTypes @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ClassificationRelationType> GetClassificationRelationType(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationType @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationType, dynamic>(usp, new { UserId = UserId, ClassificationRelationTypeId = ClassificationRelationTypeId });

        }
        public Task<List<ClassificationRelationTypeLanguage>> GetClassificationRelationTypeLanguages(string UserId, int ClassificationRelationTypeId)
        {
            string usp = "usp_ClassificationRelationTypeLanguages @UserId, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, ClassificationRelationTypeId = ClassificationRelationTypeId });

        }
        public Task<ClassificationRelationTypeLanguage> GetClassificationRelationTypeLanguage(string UserId, int ClassificationRelationTypeLanguageId)
        {
            string usp = "usp_ClassificationRelationTypeLanguage @UserId, @ClassificationPageLanguageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, ClassificationRelationTypeLanguageId = ClassificationRelationTypeLanguageId });

        }
        public Task<List<ClassificationRole>> GetClassificationRoles(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationRoles @UserId, ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationRole, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationRole> GetClassificationRole(string UserId, int ClassificationRoleId)
        {
            string usp = "usp_ClassificationRole @UserId, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRole, dynamic>(usp, new { UserId = UserId, ClassificationRoleId = ClassificationRoleId });

        }
        public Task<List<ClassificationUser>> GetClassificationUsers(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationUsers @UserId, ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationUser, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationUser> GetClassificationUser(string UserId, int ClassificationUserId)
        {
            string usp = "usp_ClassificationUser @UserId, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUser, dynamic>(usp, new { UserId = UserId, ClassificationUserId = ClassificationUserId });

        }
        public Task<List<ClassificationValueRole>> GetClassificationValueRoles(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueRoles @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueRole, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationValueRole> GetClassificationValueRole(string UserId, int ClassificationValueRoleId)
        {
            string usp = "usp_ClassificationValueRole @UserId, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRole, dynamic>(usp, new { UserId = UserId, ClassificationValueRoleId = ClassificationValueRoleId });

        }
        public Task<List<ClassificationValueUser>> GetClassificationValueUsers(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueUsers @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUser, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

        }
        public Task<ClassificationValueUser> GetClassificationValueUser(string UserId, int ClassificationValueUserId)
        {
            string usp = "usp_ClassificationValueUser @UserId, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUser, dynamic>(usp, new { UserId = UserId, ClassificationValueUserId = ClassificationValueUserId });

        }
        public Task<List<ClassificationValue>> GetClassificationValues(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValues @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValue, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });

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
