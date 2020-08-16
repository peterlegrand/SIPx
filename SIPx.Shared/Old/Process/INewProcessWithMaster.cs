using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessWithMaster
    {
        List<NewProcessFromDB> ProcessFields { get; set; }
        List<ProjectList> Projects { get; set; }
        List<UserList> Users { get; set; }
    }
}