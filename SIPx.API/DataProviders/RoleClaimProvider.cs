﻿
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
    public class RoleClaimProvider : IRoleClaimProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public RoleClaimProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<RoleClaimCreateGet> CreateGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimCreateGet @UserId, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<RoleClaimCreateGet, dynamic>(usp, new { UserId, RoleId });

        }
        public Task<List<ClaimList>> CreateGetClaimList(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimCreateGetClaimList @UserId, @RoleID";
            return _sqlDataAccess.LoadData<ClaimList, dynamic>(usp, new { UserId, RoleId });

        }
        public async Task<List<ErrorMessage>> CreatePostCheck(RoleClaimCreateGet RoleClaim)
        {
            string usp = "usp_RoleClaimCreatePostCheck @RoleId, @ClaimId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, RoleClaim);
            return ErrorMessages;
        }

        public bool CreatePost(RoleClaimCreateGet RoleClaim)
        {
            string usp = "usp_RoleClaimCreatePost @RoleId, @ClaimId";
            _sqlDataAccess.SaveData<RoleClaimCreateGet>(usp, RoleClaim);
            return true;
        }

        public Task<List<RoleClaimIndexGet>> IndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimIndexGet @UserID, @RoleId";
            return _sqlDataAccess.LoadData<RoleClaimIndexGet, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });

        }


        public async Task<RoleClaimDeleteGet> DeleteGet(string UserId, int RoleClaimId)
        {
            string usp = "usp_RoleClaimDeleteGet @UserId, @RoleClaimID";
            return await _sqlDataAccess.LoadSingleRecord<RoleClaimDeleteGet, dynamic>(usp, new { UserId, RoleClaimId });

        }

        public bool DeletePost(string UserId, int RoleClaimId)
        {
            string usp = "usp_RoleClaimDeletePost @UserId, @RoleClaimId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, RoleClaimId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int RoleClaimId)
        {
            string usp = "usp_RoleClaimDeletePostCheck @UserId, @RoleClaimId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, RoleClaimId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, RoleClaimId });
            return ErrorMessages;
        }

    }
}
