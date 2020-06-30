using SIPx.API.ViewModels;
using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<Classification> GetClassification(string UserId, int ClassificationId);
        Task<ClassificationEditGet> GetClassificationEdit(string UserId, int ClassificationId);
        Task<ClassificationLanguage> GetClassificationLanguage(string UserId, int ClassificationLanguageId);
        Task<List<ClassificationLanguage>> GetClassificationLanguages(string UserId, int ClassificationId);
        Task<ClassificationLevel> GetClassificationLevel(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelLanguage> GetClassificationLevelLanguage(string UserId, int ClassificationLevelLanguageId);
        Task<List<ClassificationLevelLanguage>> GetClassificationLevelLanguages(string UserId, int ClassificationLevelId);
        Task<List<ClassificationLevel>> GetClassificationLevels(string UserId, int ClassificationId);
        Task<ClassificationPage> GetClassificationPage(string UserId, int ClassificationPageId);
        Task<ClassificationPageLanguage> GetClassificationPageLanguage(string UserId, int ClassificationPageLanguageId);
        Task<List<ClassificationPageLanguage>> GetClassificationPageLanguages(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageList>> GetClassificationPageList(string UserId, int ClassificationId);
        Task<List<ClassificationPage>> GetClassificationPages(string UserId, int ClassificationId);
        Task<ClassificationPageSection> GetClassificationPageSection(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionLanguage> GetClassificationPageSectionLanguage(string UserId, int ClassificationPageSectionLanguageId);
        Task<List<ClassificationPageSectionLanguage>> GetClassificationPageSectionLanguages(string UserId, int ClassificationPageSectionId);
        Task<List<ClassificationPageSection>> GetClassificationPageSections(string UserId, int ClassificationPageId);
        Task<ClassificationRelationType> GetClassificationRelationType(string UserId, int ClassificationRelationTypeId);
        Task<ClassificationRelationTypeLanguage> GetClassificationRelationTypeLanguage(string UserId, int ClassificationRelationTypeLanguageId);
        Task<List<ClassificationRelationTypeLanguage>> GetClassificationRelationTypeLanguages(string UserId, int ClassificationRelationTypeId);
        Task<List<ClassificationRelationType>> GetClassificationRelationTypes(string UserId);
        Task<ClassificationRole> GetClassificationRole(string UserId, int ClassificationRoleId);
        Task<List<ClassificationRole>> GetClassificationRoles(string UserId, int ClassificationId);
        Task<List<Classification>> GetClassifications(string UserId);
        Task<ClassificationUser> GetClassificationUser(string UserId, int ClassificationUserId);
        Task<List<ClassificationUser>> GetClassificationUsers(string UserId, int ClassificationId);
        Task<ClassificationValueRole> GetClassificationValueRole(string UserId, int ClassificationValueRoleId);
        Task<List<ClassificationValueRole>> GetClassificationValueRoles(string UserId, int ClassificationId);
        Task<List<ClassificationValue>> GetClassificationValues(string UserId, int ClassificationId);
        Task<ClassificationValueUser> GetClassificationValueUser(string UserId, int ClassificationValueUserId);
        Task<List<ClassificationValueUser>> GetClassificationValueUsers(string UserId, int ClassificationId);
        bool PostClassification(ClassificationCreatePost Classification);
        Task<string> PostClassificationCheck(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);
        Task<string> PutClassificationCheck(ClassificationUpdatePut Classification);
    }
}