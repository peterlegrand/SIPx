
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
    public class FavoriteProvider : IFavoriteProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FavoriteProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<bool> Add(FavoritesAdd Favorite)
        {
            string usp = "usp_FavoriteAdd @UserID, @Controller, @Action";
            _sqlDataAccess.SaveData<FavoritesAdd>(usp, Favorite);
            return true;
        }


    }
}
