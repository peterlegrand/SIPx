
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
    public class FrontUserProvider : IFrontUserProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontUserProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontPersonDashboard> IndexGet(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboard @CurrentUserId  , @SelectedPersonId";
            var User = await _sqlDataAccess.LoadSingleRecord<FrontPersonDashboard, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return User;
        }

        public async Task<List<FrontUserIndexGetAddress>> IndexGetAddress(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardAddress @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetAddress, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetTelecom>> IndexGetTelecom(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardTelecom @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetTelecom, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetOrganization>> IndexGetOrganization(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardOrganization @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetOrganization, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetProject>> IndexGetProject(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardProject @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetProject, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetContent>> IndexGetContent(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardContent  @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetContent, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetProcess>> IndexGetProcess(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardProcess  @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetProcess, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

    }
}
