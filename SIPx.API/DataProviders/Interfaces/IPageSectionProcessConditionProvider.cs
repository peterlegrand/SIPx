﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionProcessConditionProvider
    {
        Task<List<PageSectionProcessConditionCreateGetClassifications>> CreateGetClassifications(string UserId);
        Task<List<ClassificationValueList>> CreateGetClassificationValues(string UserId, int ClassificationId);
        Task<string> CreatePost(PageSectionProcessConditionCreateGet PageSectionProcessCondition);
        Task<string> CreatePostCheck(PageSectionProcessConditionCreateGet PageSectionProcessCondition);
        Task<PageSectionProcessConditionDeleteGet> DeleteGet(string UserId, int PageSectionProcessConditionId);
        bool DeletePost(string UserId, int PageSectionProcessConditionId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PageSectionProcessConditionId);
        Task<List<PageSectionProcessConditionIndexGet>> IndexGet(string UserId, int PageSectionId);
        Task<List<PageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int PageSectionId);
        Task<PageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int PageSectionLanguageId);
        Task<PageSectionProcessConditionUpdateGet> UpdateGet(string UserId, int PageSectionProcessConditionId);
        bool UpdatePost(PageSectionProcessConditionUpdateGet PageSectionProcessCondition);
        Task<List<ErrorMessage>> UpdatePostCheck(PageSectionProcessConditionUpdateGet PageSectionProcessCondition);
    }
}