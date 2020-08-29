
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

        public async Task<FrontUserIndexGet> IndexGet(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGet @CurrentUserId  , @SelectedPersonId";
            var User = await _sqlDataAccess.LoadSingleRecord<FrontUserIndexGet, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return User;
        }

        public async Task<List<FrontUserIndexGetAddress>> IndexGetAddress(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGetAddress @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetAddress, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetTelecom>> IndexGetTelecom(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGetTelecom @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetTelecom, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetOrganization>> IndexGetOrganization(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGetOrganization @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetOrganization, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetProject>> IndexGetProject(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGetProject @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetProject, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetContent>> IndexGetContent(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGetContent  @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetContent, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontUserIndexGetProcess>> IndexGetProcess(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontUserIndexGetProcess  @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontUserIndexGetProcess, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

    }
}
