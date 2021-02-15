using Microsoft.AspNetCore.Identity;
using SIPx.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API
{
    public class DevClaimCheck : IClaimCheck
    {
        private readonly UserManager<SipUser> _userManager;
        private readonly RoleManager<SipRole> _roleManager;

        public DevClaimCheck(UserManager<SipUser> userManager, RoleManager<SipRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }
        public async Task<bool> CheckClaim(SipUser User, string ClaimType, string ClaimValue)
        {

                        return true;
        }
    }
}
