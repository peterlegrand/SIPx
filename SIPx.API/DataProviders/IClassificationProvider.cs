using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<List<ClassificationCreateGetSequence>> ClassificationCreateGetSequence(string UserId);
        bool ClassificationCreatePost(ClassificationCreatePost Classification);
        Task<string> ClassificationCreatePostCheck(ClassificationCreatePost Classification);
        Task<List<ClassificationIndexGet>> ClassificationIndexGet(string UserId);
        Task<List<ClassificationLanguageIndexGet>> ClassificationLanguageIndexGet(string UserId, int ClassificationId);
        Task<ClassificationLanguageIndexGet> ClassificationLanguageUpdateGet(string UserId, int ClassificationLanguageId);
        Task<List<LanguageList>> ClassificationLangugageCreateGetLanguageList(string UserId, int ClassificationId);
        bool ClassificationPageCreatePost(ClassificationPageCreatePost ClassificationPage);
        Task<string> ClassificationPageCreatePostCheck(ClassificationPageCreatePost ClassificationPage);
        Task<List<ClassificationPageIndexGet>> ClassificationPageIndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationPageLanguageIndexGet>> ClassificationPageLanguageIndexGet(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageList>> ClassificationPageListGet(string UserId, int ClassificationId);
        Task<List<SequenceList>> ClassificationPageSectionCreateGetSequence(string UserId, int ClassificationPageId);
        bool ClassificationPageSectionCreatePost(ClassificationPageSectionCreatePost ClassificationPageSection);
        Task<string> ClassificationPageSectionCreatePostCheck(ClassificationPageSectionCreatePost ClassificationPageSection);
        Task<List<ClassificationPageSectionIndexGet>> ClassificationPageSectionIndexGet(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageSectionLanguageIndexGet>> ClassificationPageSectionLanguageIndexGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionLanguageIndexGet> ClassificationPageSectionLanguageUpdateGet(string UserId, int ClassificationPageSectionLanguageId);
        Task<List<ClassificationPageSectionSequenceList>> ClassificationPageSectionSequenceListBySectionIdGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionUpdateGet> ClassificationPageSectionUpdateGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageUpdateGet> ClassificationPageUpdateGet(string UserId, int ClassificationPageId);
        bool ClassificationRelationTypeCreatePost(ClassificationRelationTypeCreatePost ClassificationRelationType);
        Task<string> ClassificationRelationTypeCreatePostCheck(ClassificationRelationTypeCreatePost ClassificationRelationType);
        Task<List<ClassificationRelationTypeIndexGet>> ClassificationRelationTypeIndexGet(string UserId);
        Task<List<ClassificationRelationTypeLanguageUpdateGet>> ClassificationRelationTypeLanguageIndexGet(string UserId, int ClassificationRelationTypeId);
        Task<ClassificationPageLanguageUpdateGet> ClassificationRelationTypeLanguageUpdateGet(string UserId, int ClassificationRelationTypeLanguageId);
        Task<List<ClassificationRelationTypeList>> ClassificationRelationTypeList(string UserId);
        Task<List<ClassificationRelationTypeList>> ClassificationRelationTypeListGet(string UserId);
        Task<ClassificationRelationTypeUpdateGet> ClassificationRelationTypeUpdateGet(string UserId, int ClassificationRelationTypeId);
        bool ClassificationRoleCreatePost(ClassificationRoleCreatePost ClassificationRole);
        Task<string> ClassificationRoleCreatePostCheck(ClassificationRoleCreatePost ClassificationRole);
        Task<List<ClassificationRoleIndexGet>> ClassificationRoleIndexGet(string UserId, int ClassificationId);
        Task<ClassificationRoleUpdateGet> ClassificationRoleUpdateGet(string UserId, int ClassificationRoleId);
        Task<ClassificationUpdateGet> ClassificationUpdateGet(string UserId, int ClassificationId);
        bool ClassificationUpdatePost(ClassificationUpdatePost Classification);
        Task<string> ClassificationUpdatePostCheck(ClassificationUpdatePost Classification);
        Task<string> ClassificationUserCreatePost(ClassificationUserCreatePost ClassificationUser);
        Task<string> ClassificationUserCreatePostCheck(ClassificationUserCreatePost ClassificationUser);
        Task<List<ClassificationUserIndexGet>> ClassificationUserIndexGet(string UserId, int ClassificationId);
        Task<ClassificationUserUpdateGet> ClassificationUserUpdateGet(string UserId, int ClassificationUserId);
        Task<ClassificationPageLanguageIndexGet> GetClassificationPageLanguageUpdateGet(string UserId, int ClassificationPageLanguageId);
    }
}