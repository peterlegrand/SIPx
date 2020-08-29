
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
    public class PageSectionDataTypeProvider : IPageSectionDataTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PageSectionDataTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<PageSectionDataTypeList>> List(string UserId)
        {
            string usp = "usp_PageSectionDataTypeList @UserId";
            return _sqlDataAccess.LoadData<PageSectionDataTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
