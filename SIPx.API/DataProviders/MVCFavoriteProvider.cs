
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
    public class MVCFavoriteProvider : IMVCFavoriteProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MVCFavoriteProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<bool> Add(MVCFavoriteAdd Favorite) 
        {
            string usp = "usp_MVCFavoriteAdd @UserID, @Controller, @Action, @RouteId, @Name, @Sequence, @MVCFavoriteGroupId";
            _sqlDataAccess.SaveData<MVCFavoriteAdd>(usp, Favorite);
            return true;
        }
        public async Task<bool> GroupAdd(MVCFavoriteGroupAdd FavoriteGroup)
        {
            string usp = "usp_MVCFavoriteGroupAdd @Name, @Sequence, @UserID";
        _sqlDataAccess.SaveData<MVCFavoriteGroupAdd>(usp, FavoriteGroup);
            return true;
        }
    public async Task<List<MVCFavoriteView>> ViewGet(string UserId, int? MVCFavoriteGroupId)
        {
            string usp = "usp_MVCFavoriteViewGet @UserID, @MVCFavoriteGroupId";
            var x = await _sqlDataAccess.LoadData<MVCFavoriteView, dynamic>(usp, new { UserId = UserId, MVCFavoriteGroupId= MVCFavoriteGroupId });
            return x;
        }
        public async Task<List<MVCFavoriteGroupView>> ViewGetGroup(string UserId)
{
            string usp = "usp_MVCFavoriteViewGetGroup @UserID";
            var x = await _sqlDataAccess.LoadData<MVCFavoriteGroupView, dynamic>(usp, new { UserId = UserId});
            return x;
        }
        public async Task<List<MVCFavoriteMenu>> Menu(string UserId)
        {
            string usp = "usp_MVCFavoriteViewMenu @UserID";
            var x = await _sqlDataAccess.LoadData<MVCFavoriteMenu, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<MVCFavoriteGroupList>> GroupList(string UserId)
        {
            string usp = "usp_MVCFavoriteGroupList @UserID";
            var x = await _sqlDataAccess.LoadData<MVCFavoriteGroupList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
