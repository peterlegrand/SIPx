
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
    public class PageSectionProcessConditionTypeProvider : IPageSectionProcessConditionTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionProcessConditionTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<PageSectionProcessConditionTypeList>> List(string UserId)
        {
            string usp = "usp_PageSectionProcessConditionTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionProcessConditionTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<PageSectionProcessConditionTypeListExtended>> ListExtended(string UserId)
        {
            string usp = "usp_PageSectionProcessConditionTypeListExtended @UserId";
            return _sqlDataAccess.LoadData<PageSectionProcessConditionTypeListExtended, dynamic>(usp, new { UserId = UserId });

        }

    }
}
