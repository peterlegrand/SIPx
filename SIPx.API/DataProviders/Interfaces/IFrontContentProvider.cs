using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontContentProvider
    {
        Task<List<FrontContentContentType>> ContentType(string UserId, int ContentTypeGroupId);
        Task<List<FrontContentContentTypeGroup>> ContentTypeContentTypeGroup(string UserId);
        Task<List<FrontContentContentNewClassification>> NewClassifications(string UserId, int ContentTypeId);

        Task<List<FrontContentContentNewClassificationLevel>> NewClassificationLevels(int ClassificationId);
        Task<List<FrontContentContentNewClassificationValue>> NewClassificationValues(string UserId, int ClassificationId, int Sequence, bool Alphabetical);
        Task<int> FrontContentCreatePost(string UserId, FrontContentContentNew Content);
        Task<FrontContentShowContent> FrontContentShowContent(string UserId, int ContentId);
        Task<FrontContentRightsUpdateGet> RightsUpdateGet(int ContentId);
        Task<List<ErrorMessage>> RightsUpdatePostCheck(FrontContentRightsUpdateGet FrontContentRights);
        bool RightsUpdatePost(FrontContentRightsUpdateGet FrontContentRights);
        Task<List<UserList>> RightsUpdateGetOwners(string UserId, bool IsRelationBasedOwnership, bool IsProjectBasedOwnership, bool IsOrganizationBasedOwnership, bool IsFreeOwnership);
        Task<List<ErrorMessage>> RightsEditUserCreatePostCheck(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser);
        Task<string> RightsEditUserCreatePost(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser);
        Task<List<FrontContentRightsEditUserIndexGet>> RightsEditUserIndexGet(string UserId, int ContentId);
        Task<FrontContentRightsEditUserDeleteGet> RightsEditUserDeleteGet(string UserId, int FrontContentRightsEditUserId);
        bool RightsEditUserDeletePost(int FrontContentRightsEditUserId);
        Task<List<UserList>> RightsUpdateGetEditUsers(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser);
        Task<List<UserList>> RightsUpdateGetReadUsers(FrontContentRightsReadUserCreateGet FrontContentRightsReadUser);
        Task<FrontContentShowContentRights> ShowContentRightsGet(int ContentId);
        Task<FrontContentContentNew> ContentNewGetContentType(int ContentTypeId);
        Task<List<FrontContentShowContentClassificationValue>> FrontContentShowContentClassificationValue(string UserId, int ContentId);

    }
}