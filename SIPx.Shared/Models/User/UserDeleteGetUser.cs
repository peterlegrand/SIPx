using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserDeleteGetUser
    {
        [Key]
        public int PersonId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string SecurityLevelName { get; set; }
    }
}
