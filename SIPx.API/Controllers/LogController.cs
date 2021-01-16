using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class LogController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly ILogProvider _logProvider;
        private readonly UserManager<SipUser> _userManager;

        public LogController(
             ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , ILogProvider logProvider 
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _logProvider = logProvider;
            _userManager = userManager;
        }

        //[HttpGet("ReadLogView/{ControllerName}")]
        //public async Task<IActionResult> ReadLogView(string ControllerName
        //    , [FromQuery(Name = "ActionName")] string ActionName, [FromQuery(Name = "IsIntRecordId")] bool IsIntRecordId, [FromQuery(Name = "IntRecordId")] int IntRecordId = 0, [FromQuery(Name = "StringRecordId")] string StringRecordId = "")

        //{
        //    var ReadLogView = await _logProvider.ReadLogGet(ControllerName, ActionName, IsIntRecordId, StringRecordId, IntRecordId);

        //    return Ok(ReadLogView);
        //}

        [HttpPost("ReadLogView")]
        public async Task<IActionResult> ReadLogView(ReadLogParameters ReadLogParameters)
        {
            var ReadLogView = await _logProvider.ReadLogGet(ReadLogParameters);

                return Ok(ReadLogView);
        
        }
    }
}