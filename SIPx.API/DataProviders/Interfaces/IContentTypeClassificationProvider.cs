﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeClassificationProvider
    {
        Task<List<ContentTypeClassificationIndexGet>> IndexGet(string UserId, int ContentTypeId);
        Task<ContentTypeClassificationUpdateGet> UpdateGet(string UserId, int ContentTypeClassificationId);
    }
}