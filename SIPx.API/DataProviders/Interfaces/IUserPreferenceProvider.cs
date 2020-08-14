using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.API.DataProviders
{
    public interface IUserPreferenceProvider
    {
        Task<List<UserPreferenceIndexGet>> UserPreferenceIndexGet(string UserId, string SelectedUserId);
        Task<UserPreferenceUpdateGet> UserPreferenceUpdateGet(string UserId, int UserPreferenceId);
        Task<bool> UserPreferenceUpdatePost(UserPreferenceUpdateGet UserPreference);
        Task<string> UserPreferenceUpdatePostCheck(UserPreferenceUpdateGet UserPreference);
    }
}