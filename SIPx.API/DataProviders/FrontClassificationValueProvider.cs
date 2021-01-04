
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
    public class FrontClassificationValueProvider : IFrontClassificationValueProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontClassificationValueProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontClassificationValueDashboard> Dashboard(string CurrentUserId, int ClassificationValueId)
        {
            string uspBase = "usp_FrontClassificationValueDashboard @CurrentUserId, @ClassificationValueId";
            var Base = await _sqlDataAccess.LoadSingleRecord<FrontClassificationValueDashboard, dynamic>(uspBase, new { CurrentUserId = CurrentUserId, ClassificationValueId = ClassificationValueId });
            string uspUsers = "usp_FrontClassificationValueDashboardUsers @CurrentUserId, @ClassificationValueId";
            var Users = await _sqlDataAccess.LoadData<FrontClassificationValueDashboardUser, dynamic>(uspUsers, new { CurrentUserId = CurrentUserId, ClassificationValueId = ClassificationValueId });
            string uspRoles = "usp_FrontClassificationValueDashboardRoles @CurrentUserId, @ClassificationValueId";
            var Roles = await _sqlDataAccess.LoadData<FrontClassificationValueDashboardRole, dynamic>(uspRoles, new { CurrentUserId = CurrentUserId, ClassificationValueId = ClassificationValueId });
            string uspContent = "usp_FrontClassificationValueDashboardContent @CurrentUserId, @ClassificationValueId";
            var Content = await _sqlDataAccess.LoadData<FrontClassificationValueDashboardContent, dynamic>(uspContent, new { CurrentUserId = CurrentUserId, ClassificationValueId = ClassificationValueId });
            string uspProcess = "usp_FrontClassificationValueDashboardProcess @CurrentUserId, @ClassificationValueId";
            var Process = await _sqlDataAccess.LoadData<FrontClassificationValueDashboardProcess, dynamic>(uspProcess, new { CurrentUserId = CurrentUserId, ClassificationValueId = ClassificationValueId });
            Base.Contents = Content;
            Base.Processes = Process;
            Base.Users = Users;
            Base.Roles = Roles;
            return Base;
        }

    }
}
