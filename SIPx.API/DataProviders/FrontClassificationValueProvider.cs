
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Metadata;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class FrontClassificationValueProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontClassificationValueProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontClassificationValueIndexGet> Dashboard(string UserId, int ClassificationValueId)
        {
            string uspBase = "usp_FrontClassificationValueIndexGet @CurrentUserId, @ClassificationValueId";
            var Base = await _sqlDataAccess.LoadSingleRecord<FrontClassificationValueIndexGet, dynamic>(uspBase, new { UserId = UserId, ClassificationValueId = ClassificationValueId });
            string uspUsers = "usp_FrontClassificationValueIndexGetUsers @UserId, @ClassificationValueId";
            var Users = await _sqlDataAccess.LoadData<FrontClassificationValueIndexGetUser, dynamic>(uspUsers, new { UserId = UserId, ClassificationValueId = ClassificationValueId });
            string uspRoles = "usp_FrontClassificationValueIndexGetRoles @UserId, @ClassificationValueId";
            var Roles = await _sqlDataAccess.LoadData<FrontClassificationValueIndexGetRole, dynamic>(uspRoles, new { UserId = UserId, ClassificationValueId = ClassificationValueId });
            string uspContent = "usp_FrontClassificationValueIndexGetContent @UserId, @ClassificationValueId";
            var Content = await _sqlDataAccess.LoadData<FrontClassificationValueIndexGetContent, dynamic>(uspContent, new { UserId = UserId, ClassificationValueId = ClassificationValueId });
            Base.Contents = Content;
            Base.Users= Users;
            Base.Roles = Roles;
            return Base;
        }

    }
}
