﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPropertyTypeProvider
    {
        Task<List<PropertyTypeList>> List(string UserId);
    }
}