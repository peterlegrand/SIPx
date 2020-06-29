
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
        public async Task<List<Classification>> GetClassifications(string UserID)
        {
            string usp = "usp_Classifications @UserID";
            var x = await _sqlDataAccess.LoadData<Classification, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Classification> GetClassification(string UserID, int ClassificationID)
        {
            string usp = "usp_Classification @UserID, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<Classification, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public async Task<List<ClassificationLanguage>> GetClassificationLanguages(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationLanguages @UserID, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLanguage, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });
            return x;
        }
        public Task<ClassificationLanguage> GetClassificationLanguage(string UserID, int ClassificationLanguageID)
        {
            string usp = "usp_ClassificationLanguage @UserID, @ClassificationLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLanguage, dynamic>(usp, new { UserID = UserID, ClassificationLanguageID = ClassificationLanguageID });

        }
        public async Task<List<ClassificationLevel>> GetClassificationLevels(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationLevels @UserID, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevel, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });
            return x;
        }
        public Task<ClassificationLevel> GetClassificationLevel(string UserID, int ClassificationLevelID)
        {
            string usp = "usp_ClassificationLevel @UserID, @ClassificationLevelID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevel, dynamic>(usp, new { UserID = UserID, ClassificationLevelID = ClassificationLevelID });

        }
        public async Task<List<ClassificationLevelLanguage>> GetClassificationLevelLanguages(string UserID, int ClassificationLevelID)
        {
            string usp = "usp_ClassificationLevelLanguages @UserID, @ClassificationLevelID";
            var x = await _sqlDataAccess.LoadData<ClassificationLevelLanguage, dynamic>(usp, new { UserID = UserID, ClassificationLevelID = ClassificationLevelID });
            return x;
        }
        public Task<ClassificationLevelLanguage> GetClassificationLevelLanguage(string UserID, int ClassificationLevelLanguageID)
        {
            string usp = "usp_ClassificationLevelLanguage @UserID, @ClassificationLevelLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationLevelLanguage, dynamic>(usp, new { UserID = UserID, ClassificationLevelLanguageID = ClassificationLevelLanguageID });

        }
        public Task<List<ClassificationPage>> GetClassificationPages(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationPages @UserID, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationPage, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public Task<ClassificationPage> GetClassificationPage(string UserID, int ClassificationPageID)
        {
            string usp = "usp_ClassificationPage @UserID, @ClassificationPageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPage, dynamic>(usp, new { UserID = UserID, ClassificationPageID = ClassificationPageID });

        }
        public Task<List<ClassificationPageLanguage>> GetClassificationPageLanguages(string UserID, int ClassificationPageID)
        {
            string usp = "usp_ClassificationPageLanguages @UserID, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageLanguage, dynamic>(usp, new { UserID = UserID, ClassificationPageID = ClassificationPageID });

        }
        public Task<ClassificationPageLanguage> GetClassificationPageLanguage(string UserID, int ClassificationPageLanguageID)
        {
            string usp = "usp_ClassificationPageLanguage @UserID, @ClassificationPageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageLanguage, dynamic>(usp, new { UserID = UserID, ClassificationPageLanguageID = ClassificationPageLanguageID });

        }
        public Task<List<ClassificationPageSection>> GetClassificationPageSections(string UserID, int ClassificationPageID)
        {
            string usp = "usp_ClassificationPageSections @UserID, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageSection, dynamic>(usp, new { UserID = UserID, ClassificationPageID = ClassificationPageID });

        }
        public Task<ClassificationPageSection> GetClassificationPageSection(string UserID, int ClassificationPageSectionID)
        {
            string usp = "usp_ClassificationPageSection @UserID, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSection, dynamic>(usp, new { UserID = UserID, ClassificationPageSectionID = ClassificationPageSectionID });

        }
        public Task<List<ClassificationPageSectionLanguage>> GetClassificationPageSectionLanguages(string UserID, int ClassificationPageSectionID)
        {
            string usp = "usp_ClassificationPageSectionLanguages @UserID, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionLanguage, dynamic>(usp, new { UserID = UserID, ClassificationPageSectionID = ClassificationPageSectionID });

        }
        public Task<ClassificationPageSectionLanguage> GetClassificationPageSectionLanguage(string UserID, int ClassificationPageSectionLanguageID)
        {
            string usp = "usp_ClassificationPageSectionLanguage @UserID, @ClassificationPageLanguageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionLanguage, dynamic>(usp, new { UserID = UserID, ClassificationPageSectionLanguageID = ClassificationPageSectionLanguageID });

        }
        public Task<List<ClassificationRelationType>> GetClassificationRelationTypes(string UserID)
        {
            string usp = "usp_ClassificationRelationTypes @UserID";
            return _sqlDataAccess.LoadData<ClassificationRelationType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<ClassificationRelationType> GetClassificationRelationType(string UserID, int ClassificationRelationTypeID)
        {
            string usp = "usp_ClassificationRelationType @UserID, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationType, dynamic>(usp, new { UserID = UserID, ClassificationRelationTypeID = ClassificationRelationTypeID });

        }
        public Task<List<ClassificationRelationTypeLanguage>> GetClassificationRelationTypeLanguages(string UserID, int ClassificationRelationTypeID)
        {
            string usp = "usp_ClassificationRelationTypeLanguages @UserID, @ClassificationRelationTypeID";
            return _sqlDataAccess.LoadData<ClassificationRelationTypeLanguage, dynamic>(usp, new { UserID = UserID, ClassificationRelationTypeID = ClassificationRelationTypeID });

        }
        public Task<ClassificationRelationTypeLanguage> GetClassificationRelationTypeLanguage(string UserID, int ClassificationRelationTypeLanguageID)
        {
            string usp = "usp_ClassificationRelationTypeLanguage @UserID, @ClassificationPageLanguageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRelationTypeLanguage, dynamic>(usp, new { UserID = UserID, ClassificationRelationTypeLanguageID = ClassificationRelationTypeLanguageID });

        }
        public Task<List<ClassificationRole>> GetClassificationRoles(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationRoles @UserID, ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationRole, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public Task<ClassificationRole> GetClassificationRole(string UserID, int ClassificationRoleID)
        {
            string usp = "usp_ClassificationRole @UserID, @ClassificationRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationRole, dynamic>(usp, new { UserID = UserID, ClassificationRoleID = ClassificationRoleID });

        }
        public Task<List<ClassificationUser>> GetClassificationUsers(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationUsers @UserID, ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationUser, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public Task<ClassificationUser> GetClassificationUser(string UserID, int ClassificationUserID)
        {
            string usp = "usp_ClassificationUser @UserID, @ClassificationUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationUser, dynamic>(usp, new { UserID = UserID, ClassificationUserID = ClassificationUserID });

        }
        public Task<List<ClassificationValueRole>> GetClassificationValueRoles(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationValueRoles @UserID, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueRole, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public Task<ClassificationValueRole> GetClassificationValueRole(string UserID, int ClassificationValueRoleID)
        {
            string usp = "usp_ClassificationValueRole @UserID, @ClassificationValueRoleID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueRole, dynamic>(usp, new { UserID = UserID, ClassificationValueRoleID = ClassificationValueRoleID });

        }
        public Task<List<ClassificationValueUser>> GetClassificationValueUsers(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationValueUsers @UserID, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUser, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public Task<ClassificationValueUser> GetClassificationValueUser(string UserID, int ClassificationValueUserID)
        {
            string usp = "usp_ClassificationValueUser @UserID, @ClassificationValueUserID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUser, dynamic>(usp, new { UserID = UserID, ClassificationValueUserID = ClassificationValueUserID });

        }
        public Task<List<ClassificationValue>> GetClassificationValues(string UserID, int ClassificationID)
        {
            string usp = "usp_ClassificationValues @UserID, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValue, dynamic>(usp, new { UserID = UserID, ClassificationID = ClassificationID });

        }
        public bool PostClassification(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreate @StatusID, @HasDropDown, @DropDownSequence, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }
        public async Task<string> PostClassificationCheck(ClassificationCreatePost Classification)
        {
            string usp = "usp_ClassificationCreateCheck @StatusID  , @HasDropDown , @DropDownSequence , @LanguageID , @Name , @Description , @MenuName , @MouseOver , @UserID ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }
        public bool PutClassification(ClassificationUpdatePut Classification)
        {
            string usp = "usp_ClassificationUpdate @classificationLanguageID, @StatusID , @DefaultPageID , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @ModifierID ";
            _sqlDataAccess.SaveData<ClassificationUpdatePut>(usp, Classification);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.
        public async Task<string> PutClassificationCheck(ClassificationUpdatePut Classification)
        {
            string usp = "usp_ClassificationUpdateCheck @classificationLanguageID, @StatusID , @DefaultPageID , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @ModifierID ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Classification);
            return CheckString;
        }
    }
}
