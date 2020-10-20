﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValueRoleProvider
    {
        Task<string> CreatePost(ClassificationValueRoleCreateGet ClassificationValueRole);
        Task<string> CreatePostCheck(ClassificationValueRoleCreatePost ClassificationValueRole);
        Task<ClassificationValueRoleDeleteGet> DeleteGet(string UserId, int ClassificationValueRoleId);
        bool DeletePost(int Id);
        Task<List<ClassificationValueRoleIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<ClassificationValueRoleUpdateGet> UpdateGet(string UserId, int ClassificationValueRoleId);
        bool UpdatePost(ClassificationValueRoleUpdateGet ClassificationValueRole);
        Task<ClassificationValueRoleCreateGetClassificationName> ClassificationValueRoleCreateGetClassificationName(string UserId, int ClassificationValueId);
    }
}