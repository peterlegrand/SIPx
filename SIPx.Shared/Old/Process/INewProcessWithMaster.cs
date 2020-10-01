using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessWithMaster
    {
        List<FrontProcessNewProcessField> ProcessFields { get; set; }
        List<ProjectList> Projects { get; set; }
        List<UserList> Users { get; set; }
        int ProcessTemplateId { get; set; }
        string UserId { get; set; }
    }
}