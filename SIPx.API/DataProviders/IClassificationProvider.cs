using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<List<ClassificationCreateGetSequence>> ClassificationCreateGetSequence(string UserId);
        Task<List<ClassificationIndexGet>> ClassificationIndexGet(string UserId);
        Task<ClassificationUpdateGet> GetClassification(string UserId, int ClassificationId);
        Task<ClassificationUpdateGet> GetClassificationEdit(string UserId, int ClassificationId);
        Task<ClassificationLanguageUpdateGet> GetClassificationLanguage(string UserId, int ClassificationLanguageId);
        Task<List<ClassificationLanguageUpdateGet>> GetClassificationLanguages(string UserId, int ClassificationId);
        Task<ClassificationLevelUpdateGet> GetClassificationLevel(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelLanguageIndex> GetClassificationLevelLanguage(string UserId, int ClassificationLevelLanguageId);
        Task<List<ClassificationLevelLanguageIndex>> GetClassificationLevelLanguages(string UserId, int ClassificationLevelId);
        Task<List<ClassificationLevelIndexGet>> GetClassificationLevels(string UserId, int ClassificationId);
        Task<ClassificationPageUpdateGet> GetClassificationPage(string UserId, int ClassificationPageId);
        Task<ClassificationPageLanguageIndex> GetClassificationPageLanguage(string UserId, int ClassificationPageLanguageId);
        Task<List<ClassificationPageLanguageIndex>> GetClassificationPageLanguages(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageList>> GetClassificationPageList(string UserId, int ClassificationId);
        Task<List<ClassificationPageIndexGet>> GetClassificationPages(string UserId, int ClassificationId);
        Task<ClassificationPageSectionUpdateGet> GetClassificationPageSection(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionLanguageUpdateGet> GetClassificationPageSectionLanguage(string UserId, int ClassificationPageSectionLanguageId);
        Task<List<ClassificationPageSectionLanguageUpdateGet>> GetClassificationPageSectionLanguages(string UserId, int ClassificationPageSectionId);
        Task<List<ClassificationPageSectionUpdateGet>> GetClassificationPageSections(string UserId, int ClassificationPageId);
        Task<ClassificationRelationTypeUpdateGet> GetClassificationRelationType(string UserId, int ClassificationRelationTypeId);
        Task<ClassificationRelationTypeLanguageUpdateGet> GetClassificationRelationTypeLanguage(string UserId, int ClassificationRelationTypeLanguageId);
        Task<List<ClassificationRelationTypeLanguageUpdateGet>> GetClassificationRelationTypeLanguages(string UserId, int ClassificationRelationTypeId);
        Task<List<ClassificationRelationTypeIndexGet>> GetClassificationRelationTypes(string UserId);
        Task<ClassificationRoleUpdateGet> GetClassificationRole(string UserId, int ClassificationRoleId);
        Task<List<ClassificationRoleUpdateGet>> GetClassificationRoles(string UserId, int ClassificationId);
        Task<ClassificationUserUpdateGet> GetClassificationUser(string UserId, int ClassificationUserId);
        Task<List<ClassificationUserUpdateGet>> GetClassificationUsers(string UserId, int ClassificationId);
        Task<ClassificationValueRoleUpdateGet> GetClassificationValueRole(string UserId, int ClassificationValueRoleId);
        Task<List<ClassificationValueRoleUpdateGet>> GetClassificationValueRoles(string UserId, int ClassificationId);
        Task<List<ClassificationValueUpdateGet>> GetClassificationValues(string UserId, int ClassificationId);
        Task<ClassificationValueUserUpdateGet> GetClassificationValueUser(string UserId, int ClassificationValueUserId);
        Task<List<ClassificationValueUserUpdateGet>> GetClassificationValueUsers(string UserId, int ClassificationId);
        bool PostClassification(ClassificationCreatePost Classification);
        Task<string> PostClassificationCheck(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);
        Task<string> PutClassificationCheck(ClassificationUpdatePut Classification);
    }
}