﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentProvider
    {
        bool UpdatePostClassification(ClassificationUpdatePost Classification);
        Task<List<ContentForPanel>> ContentForPanel(string UserId);
        Task<ContentDeleteGet> DeleteGet(string UserId, int ContentId);
        bool DeletePost(int Id);
        Task<ClassificationIndexGet> CreateGetClassificationById(int Id, int LanguageId);
        Task<List<ClassificationList>> CreateGetClassificationList(string UserId, int ContentTypeId);
        List<ClassificationIndexGet> CreateGetClassifications2(int LanguageId);
        Task<ContentCreateListSet> CreateGetContentCreateListSet(string UserId, int ContentTypeId);
        Task<List<ClassificationValueList>> CreateGetContentCreateListSet2(string UserId, int ClassificationId);
        Task<List<Content>> IndexGet(string UserId);
        //Task<List<ContentType>> GetContentTypes(string UserId);
        Task<List<LanguageList>> CreateGetLanguageList(string UserId);
        Task<List<OrganizationList>> CreateGetOrganizationList(string UserId);
        bool CreatePostClassification(ClassificationCreatePost Classification);
        Task<List<ContentType>> CreateGetContentTypes(string UserId);
    }
}