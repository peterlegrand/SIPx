using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleGroupProvider
    {
        Task<string> CreatePost(RoleGroupCreatePost RoleGroup);
        Task<string> CreatePostCheck(RoleGroupCreatePost RoleGroup);
        Task<RoleGroupDeleteGet> DeleteGet(string UserId, int RoleGroupId);
        bool DeletePost(int Id);
        Task<List<RoleGroupIndexGet>> IndexGet(string UserId);
        Task<List<RoleGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int RoleGroupId);
        Task<ObjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<RoleGroupUpdateGet> UpdateGet(string UserId, int RoleGroupId);
        bool UpdatePost(RoleGroupUpdateGet RoleGroup); 
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<List<RoleGroupList>> List(string UserId);
    }
}