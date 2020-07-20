﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectProvider
    {
        Task<List<ProjectIndexGet>> ProjectIndexGet(string UserId);
        Task<List<ProjectLanguageIndexGet>> ProjectLanguageIndexGet(string UserId, int ProjectId);
        Task<ProjectLanguageUpdateGet> ProjectLanguageUpdateGet(string UserId, int ProjectLanguageId);
        Task<List<ProjectTypeIndexGet>> ProjectTypeIndexGet(string UserId);
        Task<List<ProjectTypeLanguageIndexGet>> ProjectTypeLanguageIndexGet(string UserId, int ProjectTypeId);
        Task<ProjectTypeLanguageUpdateGet> ProjectTypeLanguageUpdateGet(string UserId, int ProjectTypeLanguageId);
        Task<ProjectTypeUpdateGet> ProjectTypeUpdateGet(string UserId, int ProjectTypeId);
        Task<ProjectUpdateGet> ProjectUpdateGet(string UserId, int ProjectId);
    }
}