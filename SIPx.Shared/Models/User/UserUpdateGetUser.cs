using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserUpdateGetUser
    {

        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string UserPhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime LockOutEnd { get; set; }
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public bool LockOutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        public int SecurityLevelId { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
    }
}
