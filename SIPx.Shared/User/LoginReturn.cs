using System;
using System.Collections.Generic;
using System.Text;

namespace SIPx.Shared.User
{
    public class LoginReturn
    {
        public string message { get; set; }
        public bool isSuccess { get; set; }
        public string errors { get; set; }
        public DateTime expireDate { get; set; }
        public string userId { get; set; }
    }
}
