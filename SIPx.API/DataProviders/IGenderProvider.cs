using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IGenderProvider
    {
        Task<List<Gender>> IndexGet(string UserId);
        Task<List<GenderList>> List(string UserId);
        Task<List<Gender>> Active(string UserId);
        Task<Gender> UpdateGet(string UserId, int GenderId);
        bool UpdatePost(GenderUpdateGet Gender);
    }
}