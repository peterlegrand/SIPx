using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTemplateOptionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int UserMenuTemplateId);
        bool CreatePost(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        bool CreatePost(UserMenuTemplateOptionCreatePost UserMenuTemplateOption);
        Task<List<ErrorMessage>> CreatePostCheck(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        Task<UserMenuTemplateOptionDeleteGet> DeleteGet(string UserId, int UserMenuTemplateOptionId);
        bool DeletePost(int Id);
        Task<List<UserMenuTemplateOptionIndexGet>> IndexGet(string UserId, int UserMenuTemplateId);
        Task<List<UserMenuTemplateOptionLanguageIndexGet>> LanguageIndexGet(string UserId, int UserMenuTemplateOptionId);
        Task<UserMenuTemplateOptionLanguageIndexGet> LanguageUpdateGet(string UserId, int UserMenuTemplateOptionLanguageId);
        Task<UserMenuTemplateOptionUpdateGet> UpdateGet(string UserId, int UserMenuTemplateOptionId);
        Task<List<ErrorMessage>> UpdatePostCheck(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption);
        bool UpdatePost(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption);
    }
}