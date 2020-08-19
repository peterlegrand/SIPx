﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IRoleGroupProvider
    {
        Task<string> CreatePost(RoleGroupCreatePost RoleGroup);
        Task<string> CreatePostCheck(RoleGroupCreatePost RoleGroup);
        Task<List<RoleGroupIndexGet>> IndexGet(string UserId);
        Task<List<RoleGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int RoleGroupId);
        Task<ObjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<RoleGroupUpdateGet> UpdateGet(string UserId, int RoleGroupId);
    }
}