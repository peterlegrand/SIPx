﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectTypeProvider
    {
        Task<string> CreatePost(ProjectTypeCreateGet ProjectType);
        Task<List<ErrorMessage>> CreatePostCheck(ProjectTypeCreateGet ProjectType);
        Task<ProjectTypeDeleteGet> DeleteGet(string UserId, int ProjectTypeId);
        bool DeletePost(string UserId, int ProjectTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectTypeId);
        Task<List<ProjectTypeIndexGet>> IndexGet(string UserId);
        Task<List<ProjectTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProjectTypeId);
        Task<ProjectTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProjectTypeLanguageId);
        Task<List<ProjectTypeList>> List(string UserId);
        Task<ProjectTypeUpdateGet> UpdateGet(string UserId, int ProjectTypeId);
        bool UpdatePost(ProjectTypeUpdateGet ProjectType);
        Task<List<ErrorMessage>> UpdatePostCheck(ProjectTypeUpdateGet ProjectType);
        Task<string> ReturnName(string UserId, int ProjectTypeId);
        Task<int> ReturnCodeTypeId(int ProjectTypeId);
    }
}