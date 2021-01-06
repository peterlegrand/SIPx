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
    public class PositionController : ControllerBase
    {
        private readonly IPositionProvider _positionProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public PositionController(IPositionProvider PositionProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _positionProvider = PositionProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }
        private async Task<PositionUpdateGet> UpdateAddDropDownBoxes(PositionUpdateGet Position, string UserId)
        {
            //PETER At the moment not used as there is nothing to load on update
            return Position;
        }
        private async Task<PositionCreateGet> CreateAddDropDownBoxes(PositionCreateGet Position, string UserId)
        {
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            Position.LanguageId = UserLanguage.LanguageId;
            Position.LanguageName = UserLanguage.Name;
            return Position;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Position = new PositionCreateGet();
                Position = await CreateAddDropDownBoxes(Position, CurrentUser.Id);
                return Ok(Position);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PositionCreateGet Position)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Position.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _positionProvider.CreatePostCheck(Position);
                if (ErrorMessages.Count > 0)
                {
                    Position = await CreateAddDropDownBoxes(Position, CurrentUser.Id);
                }
                else
                {
                    _positionProvider.CreatePost(Position);
                }
                PositionCreateGetWithErrorMessages PositionWithErrorMessage = new PositionCreateGetWithErrorMessages { Position = Position, ErrorMessages = ErrorMessages };
                return Ok(PositionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PositionCreateGetWithErrorMessages PositionWithNoRights = new PositionCreateGetWithErrorMessages { Position = Position, ErrorMessages = ErrorMessages };
            return Ok(PositionWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index() //int Id) PETER CHECK it had this Id but I think no need
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("Positions", "PositionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _positionProvider.IndexGet(CurrentUser.Id));
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Positions", "PositionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _positionProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PositionUpdateGet Position)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Position.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _positionProvider.UpdatePostCheck(Position);
                if (ErrorMessages.Count > 0)
                {
                    Position = await UpdateAddDropDownBoxes(Position, CurrentUser.Id);
                }
                else
                {
                    _positionProvider.UpdatePost(Position);
                }
                PositionUpdateGetWithErrorMessages PositionWithErrorMessage = new PositionUpdateGetWithErrorMessages { Position = Position, ErrorMessages = ErrorMessages };
                return Ok(PositionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PositionUpdateGetWithErrorMessages PositionWithNoRights = new PositionUpdateGetWithErrorMessages { Position = Position, ErrorMessages = ErrorMessages };
            return Ok(PositionWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Positions", "PositionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _positionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PositionDeleteGet Position)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Position.UserId= CurrentUser.Id;
                //var CheckString = await _positionProvider.DeletePostCheck(Position);
                //if (CheckString.Length == 0)
                //{
                _positionProvider.DeletePost(CurrentUser.Id, Position.PositionId);
                return Ok(Position);
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

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("PositionLanguages", "PositionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _positionProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("PositionLanguages", "PositionLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _positionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
    }