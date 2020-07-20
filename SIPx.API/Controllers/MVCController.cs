using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class MVCController : ControllerBase
    {
        private readonly UserManager<SipUser> _userManager;
        private readonly IUITermLanguageCustomizationProvider _uITermProvider;

        public MVCController(UserManager<SipUser> userManager, IUITermLanguageCustomizationProvider UITermProvider)
        {
            _userManager = userManager;
            _uITermProvider = UITermProvider;
        }

        [HttpGet("{controllerName}/{actionName}")] //("{Controller}/{Action}/{LanguageID}")]
        public async Task<IActionResult> MVC(string controllerName, string actionName) //string Controller = "a", string Action = "b", string LanguageId = "1")
        {

                        var CurrentUser = await _userManager.GetUserAsync(User);
            //Namecontroller = "Classification";
            //action = "Index";
            
            var a = _uITermProvider.UITermLanguageCustomizationIndexGet(controllerName, actionName, CurrentUser.Id);
            return Ok(a);


        }

    }
}
