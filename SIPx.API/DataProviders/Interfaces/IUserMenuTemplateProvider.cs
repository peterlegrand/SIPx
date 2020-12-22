using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTemplateProvider
    {
        bool CreatePost(UserMenuTemplateCreateGet UserMenuTemplate);
        Task<List<ErrorMessage>> CreatePostCheck(UserMenuTemplateCreateGet UserMenuTemplate);
        Task<UserMenuTemplateDeleteGet> DeleteGet(string UserId, int UserMenuTemplateId);
        bool DeletePost(int Id);
        Task<List<UserMenuTemplateIndexGet>> IndexGet(string UserId);
        Task<List<UserMenuTemplateLanguageIndexGet>> LanguageIndexGet(string UserId, int UserMenuTemplateId);
        Task<UserMenuTemplateLanguageIndexGet> LanguageUpdateGet(string UserId, int UserMenuTemplateLanguageId);
        Task<UserMenuTemplateUpdateGet> UpdateGet(string UserId, int UserMenuTemplateID);
        bool UpdatePost(UserMenuTemplateUpdateGet UserMenuTemplate);
        bool UpdatePut(UserMenuTemplateUpdateGet UserMenuTemplate);
        Task<List<ErrorMessage>> UpdatePostCheck(UserMenuTemplateUpdateGet UserMenuTemplate);
    }
}