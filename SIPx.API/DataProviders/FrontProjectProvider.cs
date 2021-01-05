
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
    public class FrontProjectProvider : IFrontProjectProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontProjectProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontProjectIndexGet> IndexGet(string UserId, int ProjectId)
        {
            string usp = "usp_FrontProjectDashboard @UserId  , @ProjectId";
            var Project = await _sqlDataAccess.LoadSingleRecord<FrontProjectIndexGet, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return Project;
        }

        public async Task<List<FrontOrganizationIndexGetSubProject>> IndexGetSubProject(string UserId, int ProjectId)
        {
            string usp = "usp_FrontProjectDashboardSubProject @UserId, @ProjectId";
            var x = await _sqlDataAccess.LoadData<FrontOrganizationIndexGetSubProject, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return x;
        }

        public async Task<List<FrontProjectIndexGetMember>> IndexGetMember(string UserId, int ProjectId)
        {
            string usp = "usp_FrontProjectDashboardMember @UserId, @ProjectId";
            var x = await _sqlDataAccess.LoadData<FrontProjectIndexGetMember, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return x;
        }

        public async Task<List<FrontProjectIndexGetContent>> IndexGetContent(string UserId, int ProjectId)
        {
            string usp = "usp_FrontProjectDashboardContent @UserId, @ProjectId";
            var x = await _sqlDataAccess.LoadData<FrontProjectIndexGetContent, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return x;
        }

        public async Task<List<FrontProjectIndexGetProcess>> IndexGetProcess(string UserId, int ProjectId)
        {
            string usp = "usp_FrontProjectDashboardProcess @UserId, @ProjectId";
            var x = await _sqlDataAccess.LoadData<FrontProjectIndexGetProcess, dynamic>(usp, new { UserId = UserId, ProjectId = ProjectId });
            return x;
        }

        //public async Task<string> IndexGetSubProjectTree(string UserId, int ProjectId)
        //{
        //    string usp = "usp_SubProjectsToJason @ProjectId, @IsRoot, @UserId ";
        //    var x = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { ProjectId = ProjectId, IsRoot = 1, UserId = UserId });
        //    return x;
        //}

    }
}
