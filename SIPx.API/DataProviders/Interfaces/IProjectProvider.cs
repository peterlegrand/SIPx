﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectProvider
    {
        Task<string> CreatePost(ProjectCreatePost Project);
        Task<string> CreatePostCheck(ProjectCreatePost Project);
        Task<List<ProjectIndexGet>> IndexGet(string UserId);
        Task<List<ProjectLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectId);
        Task<ProjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectLanguageId);
        Task<List<ProjectList>> List(string UserId);
        Task<ProjectUpdateGet> UpdateGet(string UserId, int ProjectId);
    }
}