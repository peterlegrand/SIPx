﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IGenderProvider
    {
        Task<List<GenderIndexGet>> IndexGet(string UserId);
        Task<List<GenderList>> List(string UserId);
        Task<List<GenderList>> Active(string UserId);
        Task<GenderUpdateGet> UpdateGet(string UserId, int GenderId);
        bool UpdatePost(GenderUpdateGet Gender);
    }
}