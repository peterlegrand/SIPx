using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IGenderProvider
    {
        Task<List<Gender>> GenderIndexGet(string UserId);
        Task<List<GenderList>> GenderList(string UserId);
        Task<List<Gender>> GendersActive(string UserId);
        Task<Gender> GenderUpdateGet(string UserId, int GenderId);
    }
}