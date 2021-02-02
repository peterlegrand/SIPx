using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class MetaContentController : ControllerBase
    {
        private readonly IMetaContentProvider _metaContentProvider;

        private readonly ICheckProvider _checkProvider;
        private IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public MetaContentController(IMetaContentProvider metaContentProvider,  ICheckProvider checkProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _metaContentProvider = metaContentProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        private async Task<MetaContentCreateGet> CreateAddDropDownBoxes(MetaContentCreateGet MetaContent, string UserId, int MetaTypeId, int MetaRecordId)
        {
            var TypeList = await _metaContentProvider.CreateGetMetaContentTypeList(UserId);
            MetaContent.MetaContentTypes = TypeList;
            var MetaContentCreateGetContentList = await _metaContentProvider.CreateGetContentList(UserId);
            var x = new Dictionary<string, string> { { "MetaTypeId", MetaTypeId.ToString() }, { "Id", MetaRecordId.ToString() } };
            MetaContent.AllRouteData = x;
            MetaContent.Contents = MetaContentCreateGetContentList;
            return MetaContent;
        }


        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id, [FromQuery(Name = "MetaTypeId")] int MetaTypeId)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var MetaContent = new MetaContentCreateGet();
                MetaContent.MetaTypeId = MetaTypeId;
                MetaContent.MetaRecordId = Id;
                MetaContent = await CreateAddDropDownBoxes(MetaContent, CurrentUser.Id, Id, MetaTypeId);
                return Ok(MetaContent);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(MetaContentCreateGet MetaContent)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            MetaContent.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _metaContentProvider.CreatePostCheck(MetaContent);
                if (ErrorMessages.Count > 0)
                {
                    MetaContent = await CreateAddDropDownBoxes(MetaContent, CurrentUser.Id, MetaContent.MetaRecordId, MetaContent.MetaTypeId);
                }
                else
                {
                    _metaContentProvider.CreatePost(MetaContent);
                }
                MetaContentCreateGetWithErrorMessages MetaContentWithErrorMessage = new MetaContentCreateGetWithErrorMessages {  MetaContent = MetaContent, ErrorMessages = ErrorMessages };
                return Ok(MetaContentWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            MetaContentCreateGetWithErrorMessages MetaContentWithNoRights = new MetaContentCreateGetWithErrorMessages { MetaContent = MetaContent, ErrorMessages = ErrorMessages };
            return Ok(MetaContentWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id, [FromQuery(Name = "MetaTypeId")] int MetaTypeId)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var MetaContent = new MetaContentIndexGet();
                MetaContent.MetaRecordId = Id;
                MetaContent.MetaTypeId = MetaTypeId;
                MetaContent.HasDeleteRights = await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "MetaContent\\Delete");
                MetaContent.HasCreateRights = await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "MetaContent\\Create");
                MetaContent.MetaContentList = await _metaContentProvider.IndexGet(CurrentUser.Id, Id, MetaTypeId);
                var x = new Dictionary<string, string> { { "MetaTypeId", MetaTypeId.ToString() }, { "Id", Id.ToString() } };
                MetaContent.AllRouteData = x;
                return Ok(MetaContent);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id, [FromQuery(Name = "MetaTypeId")] int MetaTypeId)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("MetaContents", "MetaContentID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _metaContentProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(MetaContentDeleteGet MetaContent)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                MetaContent.UserId = CurrentUser.Id;
                //var CheckString = await _MetaContentProvider.DeletePostCheck(MetaContent);
                //if (CheckString.Length == 0)
                //{
                _metaContentProvider.DeletePost(CurrentUser.Id, MetaContent.MetaContentId);
                return Ok(MetaContent);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                    //Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
    }
}