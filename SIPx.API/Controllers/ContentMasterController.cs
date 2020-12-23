using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.Shared;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ContentMasterController : ControllerBase
    {
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IContentTypeClassificationStatusProvider _contentTypeClassificationStatusProvider;
        private readonly IContentTypeClassificationProvider _contentTypeClassificationProvider;
        private readonly IContentTypeGroupProvider _contentTypeGroupProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public ContentMasterController(IContentTypeProvider contentTypeProvider, IContentTypeClassificationStatusProvider contentTypeClassificationStatusProvider, IContentTypeClassificationProvider contentTypeClassificationProvider, IContentTypeGroupProvider contentTypeGroupProvider, IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck,  Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _contentTypeProvider = contentTypeProvider;
            _contentTypeClassificationStatusProvider = contentTypeClassificationStatusProvider;
            _contentTypeClassificationProvider = contentTypeClassificationProvider;
            _contentTypeGroupProvider = contentTypeGroupProvider;
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

       
    }
}