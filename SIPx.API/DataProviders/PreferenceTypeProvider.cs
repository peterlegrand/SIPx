
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
    public class PreferenceTypeProvider 
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PreferenceTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<PreferenceType>> PreferenceTypeIndexGet(string UserId)
        //{
        //    string usp = "usp_PreferenceTypeIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<PreferenceType, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<PreferenceType> PreferenceTypeUpdateGet(string UserId, int PreferenceTypeId)
        //{
        //    string usp = "usp_PreferenceTypeUpdateGet @UserId, @PreferenceTypeID";
        //    return _sqlDataAccess.LoadSingleRecord<PreferenceType, dynamic>(usp, new { UserId = UserId, PreferenceTypeId = PreferenceTypeId });

        //}
    }
}
