
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
    public class PageSectionConditionTypeProvider : IPageSectionConditionTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionConditionTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<PageSectionConditionTypeList>> List(string UserId)
        {
            string usp = "usp_PageSectionConditionTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionConditionTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<PageSectionConditionTypeListExtended>> ListExtended(string UserId)
        {
            string usp = "usp_PageSectionConditionTypeListExtended @UserId";
            return _sqlDataAccess.LoadData<PageSectionConditionTypeListExtended, dynamic>(usp, new { UserId = UserId });

        }

    }
}
