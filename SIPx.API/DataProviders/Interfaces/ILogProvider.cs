using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ILogProvider
    {
        Task<List<ReadLogGet>> ReadLogGet(LogParameters ReadLogParameters);
    }
}