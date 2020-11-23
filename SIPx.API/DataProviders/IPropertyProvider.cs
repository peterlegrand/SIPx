﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPropertyProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        bool CreatePost(PropertyCreateGet Property);
        Task<string> CreatePostCheck(PropertyCreateGet Property);
        Task<PropertyDeleteGet> DeleteGet(string UserId, int PropertyId);
        bool DeletePost(int PropertyId);
        Task<List<PropertyIndexGet>> IndexGet(string UserId);
        Task<List<PropertyList>> List(string UserId);
        Task<PropertyUpdateGet> UpdateGet(string UserId, int PropertyId);
        bool UpdatePost(PropertyUpdateGet Property);
        Task<string> UpdatePostCheck(PropertyUpdateGet Property);
    }
}