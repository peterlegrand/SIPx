﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTemplateOptionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int UserMenuTemplateId);
        bool CreatePost(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        bool CreatePost(UserMenuTemplateOptionCreatePost UserMenuTemplateOption);
        Task<string> CreatePostCheck(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        Task<List<UserMenuTemplateOptionIndexGet>> IndexGet(string UserId, int UserMenuTemplateId);
        Task<List<UserMenuTemplateOptionLanguageIndexGet>> LanguageIndexGet(string UserId, int UserMenuTemplateOptionId);
        Task<UserMenuTemplateOptionLanguageIndexGet> LanguageUpdateGet(string UserId, int UserMenuTemplateOptionLanguageId);
        Task<UserMenuTemplateOptionUpdateGet> UpdateGet(string UserId, int UserMenuTemplateOptionId);
    }
}