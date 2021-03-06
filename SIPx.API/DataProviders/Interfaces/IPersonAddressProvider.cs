﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonAddressProvider
    {
        Task<string> CreatePost(PersonAddressCreateGet PersonAddress);
        Task<List<ErrorMessage>> CreatePostCheck(PersonAddressCreateGet PersonAddress);
        Task<PersonAddressDeleteGet> DeleteGet(string UserId, int PersonAddressId);
        bool DeletePost(string UserId, int PersonAddressId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonAddressId);
        Task<List<PersonAddressIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonAddressUpdateGet> UpdateGet(string UserId, int PersonAddressId);
        bool UpdatePost(PersonAddressUpdateGet PersonAddress);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonAddressUpdateGet PersonAddress);
    }
}