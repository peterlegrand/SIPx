using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using SIPx.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace SIPx.API.Classes
{
    public class SIPUserManager
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly UserManager<SipUser> _userManager;
        SipUser user = new SipUser()
        {
            Email = "eplegrand@gmail.com",
            Id = "abc",
            UserName = "eplegrand@gmail.com"
        };

        public SIPUserManager(IHostingEnvironment hostingEnvironment, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _hostingEnvironment = hostingEnvironment;
            _userManager = userManager;

        }

        //        public UserManager<SipUser> UserManager { get; }

        public async Task<SipUser> GetUser(ClaimsPrincipal User)
        {

            if (_hostingEnvironment.IsEnvironment("Development"))
            {
                return user;
            }
            else
            {

                return await _userManager.GetUserAsync(User);
            }
        }
    }
    //    public class SIPUserManager : Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser>
    //{
    //    private readonly IHostingEnvironment _hostingEnvironment;

    //    public SIPUserManager(IHostingEnvironment hostingEnvironment , IUserStore<SipUser> store, IOptions<IdentityOptions> optionsAccessor, IPasswordHasher<SipUser> passwordHasher, IEnumerable<IUserValidator<SipUser>> userValidators, IEnumerable<IPasswordValidator<SipUser>> passwordValidators, ILookupNormalizer keyNormalizer, IdentityErrorDescriber errors, IServiceProvider services, ILogger<UserManager<SipUser>> logger) : base(store, optionsAccessor, passwordHasher, userValidators, passwordValidators, keyNormalizer, errors, services, logger)
    //    {
    //        _hostingEnvironment = hostingEnvironment;


    //    }
    //    public GetUserAsync(SipUser User )
    //    {

    //    }
    //}
}
