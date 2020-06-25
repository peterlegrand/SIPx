using SIPx.API.ViewModels;
using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<Classification> GetClassification(string UserID, int ClassificationID);
        Task<ClassificationLanguage> GetClassificationLanguage(string UserID, int ClassificationLanguageID);
        Task<List<ClassificationLanguage>> GetClassificationLanguages(string UserID, int ClassificationID);
        Task<ClassificationLevel> GetClassificationLevel(string UserID, int ClassificationLevelID);
        Task<ClassificationLevelLanguage> GetClassificationLevelLanguage(string UserID, int ClassificationLevelLanguageID);
        Task<List<ClassificationLevelLanguage>> GetClassificationLevelLanguages(string UserID, int ClassificationLevelID);
        Task<List<ClassificationLevel>> GetClassificationLevels(string UserID, int ClassificationID);
        Task<ClassificationPage> GetClassificationPage(string UserID, int ClassificationPageID);
        Task<ClassificationPageLanguage> GetClassificationPageLanguage(string UserID, int ClassificationPageLanguageID);
        Task<List<ClassificationPageLanguage>> GetClassificationPageLanguages(string UserID, int ClassificationPageID);
        Task<List<ClassificationPage>> GetClassificationPages(string UserID, int ClassificationID);
        Task<ClassificationPageSection> GetClassificationPageSection(string UserID, int ClassificationPageSectionID);
        Task<ClassificationPageSectionLanguage> GetClassificationPageSectionLanguage(string UserID, int ClassificationPageSectionLanguageID);
        Task<List<ClassificationPageSectionLanguage>> GetClassificationPageSectionLanguages(string UserID, int ClassificationPageSectionID);
        Task<List<ClassificationPageSection>> GetClassificationPageSections(string UserID, int ClassificationPageID);
        Task<ClassificationRelationType> GetClassificationRelationType(string UserID, int ClassificationRelationTypeID);
        Task<ClassificationRelationTypeLanguage> GetClassificationRelationTypeLanguage(string UserID, int ClassificationRelationTypeLanguageID);
        Task<List<ClassificationRelationTypeLanguage>> GetClassificationRelationTypeLanguages(string UserID, int ClassificationRelationTypeID);
        Task<List<ClassificationRelationType>> GetClassificationRelationTypes(string UserID);
        Task<ClassificationRole> GetClassificationRole(string UserID, int ClassificationRoleID);
        Task<List<ClassificationRole>> GetClassificationRoles(string UserID, int ClassificationID);
        Task<List<Classification>> GetClassifications(string UserID);
        Task<ClassificationUser> GetClassificationUser(string UserID, int ClassificationUserID);
        Task<List<ClassificationUser>> GetClassificationUsers(string UserID, int ClassificationID);
        Task<ClassificationValueRole> GetClassificationValueRole(string UserID, int ClassificationValueRoleID);
        Task<List<ClassificationValueRole>> GetClassificationValueRoles(string UserID, int ClassificationID);
        Task<ClassificationValueUser> GetClassificationValueUser(string UserID, int ClassificationValueUserID);
        Task<List<ClassificationValueUser>> GetClassificationValueUsers(string UserID, int ClassificationID);
        bool PostClassification(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);
    }
}