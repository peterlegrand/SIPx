
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
    public class FrontProcessProvider : IFrontProcessProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontProcessProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<NewProcessShowTemplateGroup>> NewProcessShowTemplateGroup(string UserId)
        {
            string usp = "usp_FrontNewProcessShowTemplateGroup @UserID";
            var x = await _sqlDataAccess.LoadData<NewProcessShowTemplateGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<NewProcessShowTemplate>> NewProcessShowTemplate(string UserId)
        {
            string usp = "usp_FrontNewProcessShowTemplate @UserID";
            var x = await _sqlDataAccess.LoadData<NewProcessShowTemplate, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
