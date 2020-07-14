﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentMasterProvider
    {
        Task<List<ContentStatus>> ContentStatusIndexGet(string UserId);
        Task<ContentStatus> ContentStatusUpdateGet(string UserId, int ContentStatusId);
        Task<List<ContentTypeClassification>> ContentTypeClassificationIndexGet(string UserId, int ContentTypeId);
        Task<List<ContentTypeClassificationStatus>> ContentTypeClassificationStatusIndexGet(string UserId);
        Task<ContentTypeClassificationStatus> ContentTypeClassificationStatusUpdateGet(string UserId, int ContentTypeClassificationStatusId);
        Task<ContentTypeClassification> ContentTypeClassificationUpdateGet(string UserId, int ContentTypeClassificationId);
        Task<List<ContentTypeGroup>> ContentTypeGroupIndexGet(string UserId);
        Task<List<ContentTypeGroupLanguage>> ContentTypeGroupLanguageIndexGet(string UserId, int ContentTypeGroupId);
        Task<ContentTypeGroupLanguage> ContentTypeGroupLanguageUpdateGet(string UserId, int ContentTypeGroupLanguageId);
        Task<ContentTypeGroup> ContentTypeGroupUpdateGet(string UserId, int ContentTypeGroupId);
        Task<List<ContentType>> ContentTypeIndexGet(string UserId);
        Task<List<ContentTypeLanguage>> ContentTypeLanguageIndexGet(string UserId, int ContentTypeId);
        Task<ContentTypeLanguage> ContentTypeLanguageUpdateGet(string UserId, int ContentTypeLanguageId);
        Task<List<ContentTypeList>> ContentTypeList(string UserId);
        Task<ContentType> ContentTypeUpdateGet(string UserId, int ContentTypeId);
    }
}