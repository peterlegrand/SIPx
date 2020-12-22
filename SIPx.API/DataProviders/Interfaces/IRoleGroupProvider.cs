using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleGroupProvider
    {
        Task<string> CreatePost(RoleGroupCreateGet RoleGroup);
        Task<List<ErrorMessage>> CreatePostCheck(RoleGroupCreateGet RoleGroup);
        Task<RoleGroupDeleteGet> DeleteGet(string UserId, int RoleGroupId);
        bool DeletePost(int Id);
        Task<List<RoleGroupIndexGet>> IndexGet(string UserId);
        Task<List<RoleGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int RoleGroupId);
        Task<ObjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<RoleGroupUpdateGet> UpdateGet(string UserId, int RoleGroupId);
        Task<List<ErrorMessage>> UpdatePostCheck(RoleGroupUpdateGet RoleGroup);
        bool UpdatePost(RoleGroupUpdateGet RoleGroup); 
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<List<RoleGroupList>> List(string UserId);
    }
}