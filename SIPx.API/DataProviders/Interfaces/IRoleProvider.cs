﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleProvider
    {
        Task<List<RoleClaimIndexGet>> ClaimIndexGet(string UserId, string RoleId);
        bool CreatePost(RoleCreateGet Role);
        Task<List<ErrorMessage>> CreatePostCheck(RoleCreateGet Role);
        Task<RoleDeleteGet> DeleteGet(string UserId, string RoleId);
        bool DeletePost(string UserId, string RoleId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, string RoleId);
        Task<List<RoleIndexGet>> IndexGet(string UserId);
        Task<List<RoleLanguageIndexGet>> LanguageIndexGet(string UserId, string RoleId);
        Task<RoleLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleLanguageId);
        Task<List<RoleList>> List(string UserId);
        Task<RoleUpdateGet> UpdateGet(string UserId, string RoleId);
        bool UpdatePost(RoleUpdateGet Role);
        Task<List<ErrorMessage>> UpdatePostCheck(RoleUpdateGet Role);
    }
}