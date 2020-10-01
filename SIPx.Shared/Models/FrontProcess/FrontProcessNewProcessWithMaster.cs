using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessNewProcessWithMaster : INewProcessWithMaster
    {

        public List<FrontProcessNewProcessField> ProcessFields { get; set; }
      //  public List<FrontProcessNewProcessDefaultValues> DefaultFieldValues { get; set; }
        public List<UserList> Users { get; set; }
        public List<ProjectList> Projects { get; set; }
        public int ProcessTemplateId { get; set; }
        public string UserId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
    }
}
