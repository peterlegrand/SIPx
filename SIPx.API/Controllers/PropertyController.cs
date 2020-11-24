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
    public class PropertyController : ControllerBase
    {
        private readonly IPropertyProvider _propertyProvider;
        private readonly IPropertyTypeProvider _propertyTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public PropertyController(IPropertyProvider propertyProvider
            , IPropertyTypeProvider propertyTypeProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _propertyProvider = propertyProvider;
            _propertyTypeProvider = propertyTypeProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PropertyCreateGet = new PropertyCreateGet();
                PropertyCreateGet.PropertyTypes = await _propertyTypeProvider.List(CurrentUser.Id);
                return Ok(PropertyCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PropertyCreateGet Property)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Property.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _classificationProvider.ClassificationCreatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                    _propertyProvider.CreatePost(Property);
                    return Ok(Property);
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
        
        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var properties = await _propertyProvider.IndexGet(CurrentUser.Id);
                return Ok(properties);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Properties", "PropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var Property = await _propertyProvider.UpdateGet(CurrentUser.Id, Id);

                Property.PropertyTypes = await _propertyTypeProvider.List(CurrentUser.Id);
                return Ok(Property);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PropertyUpdateGet Property)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Property.UserId = CurrentUser.Id;
                Property.PropertyTypes = await _propertyTypeProvider.List(CurrentUser.Id);

                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _propertyProvider.UpdatePost(Property);
                    return Ok(Property);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Properties", "PropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _propertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PropertyDeleteGet Property)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _classificationProvider.DeletePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _propertyProvider.DeletePost(Property.PropertyId);
                return Ok(Property);
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

        //[HttpPost("LanguageCreate")]
        //public async Task<IActionResult> LanguageCreate(ObjectLanguageCreatePost Classification)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    Classification.UserId = CurrentUser.Id;
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        var CheckString = await _masterProvider.PostObjectLanguageCheck("CLassification", Classification.LanguageId, Classification.ObjectId);
        //        if (CheckString)
        //        {
        //            Classification.TableName = "Classification";
        //            _masterProvider.PostObjectLanguage(Classification);
        //            return Ok(Classification);
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = CheckString,
        //        });

        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });

        //}

        //[HttpGet("LanguageCreate/{Id:int}")]
        //public async Task<IActionResult> LanguageCreate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        var ClassificationCreateGet = new ObjectLanguageCreateGet();
        //        ClassificationCreateGet.ObjectId = Id;
        //        var LanguageList = await _classificationProvider.LangugageCreateGetLanguageList(CurrentUser.Id, Id);
        //        if (LanguageList.Count == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No active languages",
        //            });
        //        }
        //        ClassificationCreateGet.Languages = LanguageList;
        //        return Ok(ClassificationCreateGet);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("LanguageIndex/{Id:int}")]
        //public async Task<IActionResult> LanguageIndex(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        if (await _checkProvider.CheckIfRecordExists("ClassificationLanguages", "ClassificationID", Id) == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No record with this ID",
        //            });
        //        }

        //        return Ok(await _classificationProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("LanguageUpdate/{Id:int}")]
        //public async Task<IActionResult> LanguageUpdate(int Id)
        //{
        //    if (await _checkProvider.CheckIfRecordExists("ClassificationLanguages", "ClassificationLanguageID", Id) == 0)
        //    {
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = "No record with this ID",
        //        });
        //    }

        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  
        //    {
        //        return Ok(await _classificationProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

    }
}