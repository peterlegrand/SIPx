
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class TermProvider 
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public TermProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<UITermLanguage>> LanguageIndexGet(string UserId, int UITermId)
        {
            string usp = "usp_UITermLanguageIndexGet @UserId, @UITermID";
            return _sqlDataAccess.LoadData<UITermLanguage, dynamic>(usp, new { UserId = UserId, UITermId = UITermId });

        }

        public Task<UITermLanguage> LanguageUpdateGet(string UserId, int UITermLanguageId)
        {
            string usp = "usp_UITermLanguageUpdateGet @UserId, @UITermLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguage, dynamic>(usp, new { UserId = UserId, UITermLanguageId = UITermLanguageId });

        }

        public Task<List<UITerm>> IndexGet(string UserId)
        {
            string usp = "usp_UITermIndexGet @UserID";
            return _sqlDataAccess.LoadData<UITerm, dynamic>(usp, new { UserId = UserId });

        }
    }
}
