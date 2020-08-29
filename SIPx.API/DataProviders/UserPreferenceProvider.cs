using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.DataProviders
{
    public class UserPreferenceProvider : IUserPreferenceProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserPreferenceProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<UserPreferenceIndexGet>> IndexGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserPreferenceIndexGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadData<UserPreferenceIndexGet, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }

        public async Task<UserPreferenceUpdateGet> UpdateGet(string UserId, int UserPreferenceId)
        {
            string usp = "usp_UserPreferenceUpdateGet @UserId, @UserPreferenceID";
            var x = await _sqlDataAccess.LoadSingleRecord<UserPreferenceUpdateGet, dynamic>(usp, new { UserId = UserId, UserPreferenceId = UserPreferenceId });
            return (x);
        }

        public async Task<string> UpdatePostCheck(UserPreferenceUpdateGet UserPreference)
        {
            string usp = "usp_UserPreferenceUpdatePostCheck @UserPreferenceId, @IntPreference, @StringPreference, @DateTimePreference, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, UserPreference);
            return CheckString;
        }

        public async Task<bool> UpdatePost(UserPreferenceUpdateGet UserPreference)
        {
            string usp = "usp_UserPreferenceUpdatePost @UserPreferenceId, @IntPreference, @StringPreference, @DateTimePreference, @CreatorId ";
            _sqlDataAccess.SaveData<UserPreferenceUpdateGet>(usp, UserPreference);
            return true;
        }


    }
}
