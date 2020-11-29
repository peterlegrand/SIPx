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
    public class ClassificationValuePropertyController : ControllerBase
    {
        private readonly IRoleProvider _roleProvider;
        private readonly IClassificationValuePropertyProvider _classificationValuePropertyProvider;
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValuePropertyController(IRoleProvider roleProvider, IClassificationValuePropertyProvider classificationValuePropertyProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationValueProvider classificationValueProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _roleProvider = roleProvider;
            _classificationValuePropertyProvider = classificationValuePropertyProvider;
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationValueProvider = classificationValueProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("CreateProperty/{Id:int}")]
        public async Task<IActionResult> CreateProperty(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationValuePropertyCreateGet = new ClassificationValuePropertyCreateGet();
                var Properties = await _classificationValuePropertyProvider.CreateGetProperties(CurrentUser.Id,Id);
                ClassificationValuePropertyCreateGet.Properties = Properties;
                ClassificationValuePropertyCreateGet.ClassificationValueId = Id;
                return Ok(ClassificationValuePropertyCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("CreateProperty")]
        public async Task<IActionResult> CreateProperty(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationValuePropertyProvider.CreatePostCheck(ClassificationValueProperty);
                //if (CheckString.Length == 0)
                //{
                return Ok(ClassificationValueProperty);
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
        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            //ClassificationValueProperty.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationValuePropertyProvider.CreatePostCheck(ClassificationValueProperty);
                //if (CheckString.Length == 0)
                //{
                _classificationValuePropertyProvider.CreatePost(ClassificationValueProperty);
                return Ok(ClassificationValueProperty);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "46"))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationValuePropertys", "ClassificationValueID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationValuePropertyProvider.IndexGet(CurrentUser.Id, Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "46"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValuePropertys", "ClassificationValuePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationValueProperty = await _classificationValuePropertyProvider.UpdateGet(CurrentUser.Id, Id);
                var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                //ClassificationValueProperty.ClassificationRelationTypes = ClassificationRelationTypes;
                //ClassificationValueProperty.Roles = await _roleProvider.List(CurrentUser.Id);

                return Ok(ClassificationValueProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationValuePropertyUpdateGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValueProperty.UserId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationValuePropertyProvider.UpdatePost(ClassificationValueProperty);
                return Ok(ClassificationValueProperty);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValuePropertys", "ClassificationValuePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValuePropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationValuePropertyDeleteGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValueProperty.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationValuePropertyProvider.DeletePostCheck(ClassificationValueProperty);
                //if (CheckString.Length == 0)
                //{
                _classificationValuePropertyProvider.DeletePost(ClassificationValueProperty.ClassificationValuePropertyId);
                return Ok(ClassificationValueProperty);
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