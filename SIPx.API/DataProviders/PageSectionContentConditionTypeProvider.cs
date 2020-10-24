
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
    public class PageSectionContentConditionTypeProvider : IPageSectionContentConditionTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionContentConditionTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<PageSectionContentConditionTypeList>> List(string UserId)
        {
            string usp = "usp_PageSectionContentConditionTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionContentConditionTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<PageSectionContentConditionTypeListExtended>> ListExtended(string UserId)
        {
            string usp = "usp_PageSectionContentConditionTypeListExtended @UserId";
            return _sqlDataAccess.LoadData<PageSectionContentConditionTypeListExtended, dynamic>(usp, new { UserId = UserId });

        }

    }
}
