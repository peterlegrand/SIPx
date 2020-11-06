using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class MVCController : ControllerBase
    {
        private readonly IHomeProvider _homeProvider;
        private readonly UserManager<SipUser> _userManager;
        private readonly IUITermLanguageCustomizationProvider _uITermProvider;

        public MVCController(SIPx.DataAccess.IHomeProvider homeProvider, UserManager<SipUser> userManager, IUITermLanguageCustomizationProvider UITermProvider)
        {
            _homeProvider = homeProvider;
            _userManager = userManager;
            _uITermProvider = UITermProvider;
        }

        [HttpGet("{controllerName}/{actionName}")] //("{Controller}/{Action}/{LanguageID}")]
        public async Task<IActionResult> MVC(string controllerName, string actionName) //string Controller = "a", string Action = "b", string LanguageId = "1")
        {

                        var CurrentUser = await _userManager.GetUserAsync(User);
            //Namecontroller = "Classification";
            //action = "Index";
            string UserId;
            if (CurrentUser == null)
            {
                UserId = await _homeProvider.StringSetting(4);
            }
            else
            {
                UserId = CurrentUser.Id;
            }
            var a = _uITermProvider.IndexGet(controllerName, actionName, UserId);
            return Ok(a);


        }

    }
}
