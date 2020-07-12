using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<string> ClassificationCheckPut(ClassificationUpdatePut Classification);
        Task<List<ClassificationCreateGetSequence>> ClassificationCreateGetSequence(string UserId);
        Task<ClassificationUpdateGet> ClassificationGet(string UserId, int ClassificationId);
        Task<List<ClassificationIndexGet>> ClassificationIndexGet(string UserId);
        Task<List<ClassificationLanguageIndexGet>> ClassificationLanguageIndexGet(string UserId, int ClassificationId);
        Task<ClassificationLanguageIndexGet> ClassificationLanguageUpdateGet(string UserId, int ClassificationLanguageId);
        Task<List<ClassificationLevelIndexGet>> ClassificationLevelIndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationLevelLanguageIndexGet>> ClassificationLevelLanguageIndexGet(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelLanguageIndexGet> ClassificationLevelLanguageUpdateGet(string UserId, int ClassificationLevelLanguageId);
        Task<ClassificationLevelUpdateGet> ClassificationLevelUpdateGet(string UserId, int ClassificationLevelId);
        Task<List<ClassificationPageIndexGet>> ClassificationPageIndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationPageLanguageIndexGet>> ClassificationPageLanguageIndexGet(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageList>> ClassificationPageListGet(string UserId, int ClassificationId);
        Task<List<ClassificationPageSectionIndexGet>> ClassificationPageSectionIndexGet(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageSectionLanguageIndexGet>> ClassificationPageSectionLanguageIndexGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionLanguageIndexGet> ClassificationPageSectionLanguageUpdateGet(string UserId, int ClassificationPageSectionLanguageId);
        Task<List<ClassificationPageSectionSequenceList>> ClassificationPageSectionSequenceListBySectionIdGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionUpdateGet> ClassificationPageSectionUpdateGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageUpdateGet> ClassificationPageUpdateGet(string UserId, int ClassificationPageId);
        Task<List<ClassificationRelationTypeIndexGet>> ClassificationRelationTypeIndexGet(string UserId);
        Task<List<ClassificationRelationTypeLanguageUpdateGet>> ClassificationRelationTypeLanguageIndexGet(string UserId, int ClassificationRelationTypeId);
        Task<ClassificationRelationTypeLanguageUpdateGet> ClassificationRelationTypeLanguageUpdateGet(string UserId, int ClassificationRelationTypeLanguageId);
        Task<ClassificationRelationTypeUpdateGet> ClassificationRelationTypeUpdateGet(string UserId, int ClassificationRelationTypeId);
        Task<List<ClassificationRoleIndexGet>> ClassificationRoleIndexGet(string UserId, int ClassificationId);
        Task<ClassificationRoleUpdateGet> ClassificationRoleUpdateGet(string UserId, int ClassificationRoleId);
        Task<ClassificationUpdateGet> ClassificationUpdateGet(string UserId, int ClassificationId);
        Task<List<ClassificationUserIndexGet>> ClassificationUserIndexGet(string UserId, int ClassificationId);
        Task<ClassificationUserUpdateGet> ClassificationUserUpdateGet(string UserId, int ClassificationUserId);
        Task<List<ClassificationValueUpdateGet>> ClassificationValueIndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationValueRoleUpdateGet>> ClassificationValueRoleIndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueRoleUpdateGet> ClassificationValueRoleUpdateGet(string UserId, int ClassificationValueRoleId);
        Task<List<ClassificationValueUserUpdateGet>> ClassificationValueUserIndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueUserUpdateGet> ClassificationValueUserUpdateGet(string UserId, int ClassificationValueUserId);
        Task<ClassificationPageLanguageIndexGet> GetClassificationPageLanguageUpdateGet(string UserId, int ClassificationPageLanguageId);
        bool PostClassification(ClassificationCreatePost Classification);
        Task<string> PostClassificationCheck(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);
    }
}