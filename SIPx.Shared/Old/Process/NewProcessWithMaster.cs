using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessWithMaster : INewProcessWithMaster
    {
     
        public List<NewProcessFromDB> ProcessFields { get; set; }
        public List<UserList> Users { get; set; }
        public List<ProjectList> Projects { get; set; }
    }
}
