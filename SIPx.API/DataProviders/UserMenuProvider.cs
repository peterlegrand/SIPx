
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class UserMenuProvider : IUserMenuProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserMenuProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "[usp_UserMenuCreateGetSequence] @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }

        public bool CreatePost(UserMenuCreateGet UserMenu)
        {
            string usp = "usp_UserMenuCreatePost @Name,  @MouseOver , @UserPageIdLeft, @UserPageIdRight , @UserMenuTypeIDLeft, @UserMenuTypeIDRight, @IconId, @Sequence,@CreatorID";
            _sqlDataAccess.SaveData<UserMenuCreateGet>(usp, UserMenu);
            return true;
        }

        public async Task<List<UserMenuIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_UserMenuIndexGet @UserID";
            List<UserMenuIndexGet> x = await _sqlDataAccess.LoadData<UserMenuIndexGet, dynamic>(usp, new { UserId });
            return x;
        }

        public Task<UserMenuUpdateGet> UpdateGet(int UserMenuID)
        {
            string usp = "usp_UserMenuUpdateGet  @UserMenuID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuUpdateGet, dynamic>(usp, new { UserMenuID });

        }

        public bool UpdatePost(UserMenuUpdateGet UserMenu)
        {
            string usp = "usp_UserMenuUpdatePost @UserMenuID, @Name, @MouseOver , @UserPageIdLeft, @UserPageIdRight , @UserMenuTypeIDLeft, @UserMenuTypeIDRight, @IconId, @Sequence, @ModifierID";
            _sqlDataAccess.SaveData<UserMenuUpdateGet>(usp, UserMenu);
            return true;
        }

        public Task<UserMenuDeleteGet> DeleteGet(string UserID, int UserMenuID)
        {
            string usp = "usp_UserMenuDeleteGet @UserId,  @UserMenuID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuDeleteGet, dynamic>(usp, new { UserID, UserMenuID });

        }

        public bool DeletePost(UserMenuDeleteGet UserMenu)
        {
            string usp = "usp_UserMenuDeletePost @UserMenuID";
            _sqlDataAccess.SaveData<UserMenuDeleteGet>(usp, UserMenu);
            return true;
        }

    }
}
