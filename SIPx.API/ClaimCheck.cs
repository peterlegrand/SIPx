using Microsoft.AspNetCore.Identity;
using SIPx.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API
{
    public class ClaimCheck : IClaimCheck
    {
        private readonly UserManager<SipUser> _userManager;
        private readonly RoleManager<SipRole> _roleManager;

        public ClaimCheck(UserManager<SipUser> userManager, RoleManager<SipRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }
        public async Task<bool> CheckClaim(SipUser User, string ClaimValue)
        {
            var Roles = await _userManager.GetRolesAsync(User);
            foreach (var Role in Roles)
            {
                var Claims = await _roleManager.GetClaimsAsync(await _roleManager.FindByNameAsync(Role));
                foreach (var Claim in Claims)
                {
                    if (Claim.Value == ClaimValue)
                    {

                        return true;
                    }
                }
            }
            return false;
        }
    }
}
