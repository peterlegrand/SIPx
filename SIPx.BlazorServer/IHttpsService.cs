using System.Threading.Tasks;

namespace SIPx.BlazorServer
{
    public interface IHttpsService
    {
        Task<string> httpPostService<T>(T Object, string Uri);
    }
}