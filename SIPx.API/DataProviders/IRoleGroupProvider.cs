using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleGroupProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(RoleGroupCreateGet RoleGroup);
        Task<List<ErrorMessage>> CreatePostCheck(RoleGroupCreateGet RoleGroup);
        Task<RoleGroupDeleteGet> DeleteGet(string UserId, int RoleGroupId);
        bool DeletePost(string UserId, int RoleGroupId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int RoleGroupId);
        Task<List<RoleGroupIndexGet>> IndexGet(string UserId);
        Task<List<RoleGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int RoleGroupId);
        Task<ObjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<List<RoleGroupList>> List(string UserId);
        Task<RoleGroupUpdateGet> UpdateGet(string UserId, int RoleGroupId);
        bool UpdatePost(RoleGroupUpdateGet RoleGroup);
        Task<List<ErrorMessage>> UpdatePostCheck(RoleGroupUpdateGet RoleGroup);
    }
}