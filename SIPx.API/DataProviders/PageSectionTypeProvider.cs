
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
    public class PageSectionTypeProvider : IPageSectionTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<PageSectionTypeList>> List(string UserId)
        {
            string usp = "usp_PageSectionTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
