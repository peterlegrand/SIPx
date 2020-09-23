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
    public class ContentController : ControllerBase
    {
        private readonly IContentTypeProvider _contentTypeProvider;
        private  IClaimCheck _claimCheck;
        private readonly IContentProvider _contentProvider;
        private readonly UserManager<SipUser> _userManager;

        public ContentController(IContentTypeProvider contentTypeProvider, IClaimCheck claimCheck, IContentProvider ContentProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _contentTypeProvider = contentTypeProvider;
            _claimCheck = claimCheck;
            _contentProvider = ContentProvider;
            _userManager = userManager;
        }
        
        [HttpGet]
        public async Task<IActionResult> Get()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))
            {
                //TOFIX PETER
                return Ok(await _contentProvider.IndexGet(CurrentUser.Id));// CurrentUser.LanguageId));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpGet("ContentType")]
        public async Task<IActionResult> ContentType()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))
            {
                //TOFIX PETER
                return Ok(await _contentTypeProvider.List(CurrentUser.Id));// CurrentUser.LanguageId));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpGet("Create/{ContentTypeId}")]
        public async Task<IActionResult> Create(int ContentTypeId)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))
            {
                //TOFIX PETER
                var Set = new ContentCreateListSet();
                Set.ContentTypeId = ContentTypeId;
                Set.LanguageList = await _contentProvider.CreateGetLanguageList(CurrentUser.Id);
                Set.ClassificationList = await _contentProvider.CreateGetClassificationList(CurrentUser.Id, ContentTypeId);
                Set.OrganizationList = await _contentProvider.CreateGetOrganizationList(CurrentUser.Id);
                
                foreach (var Classification in Set.ClassificationList)
                {
                    //PETER TODO the following line is not working as the classificationlist class is probably the wrong class that only has 2 fields.  It should have also a value field

//                    Classification.ClassificationValueList = await _contentProvider.GetContentCreateListSet2(CurrentUser.Id, Classification.ClassificationId);
                }

                return Ok(Set);// CurrentUser.LanguageId));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }


        //        [HttpGet("{Id:int}")]
        //        public async Task<ClassificationViewGet> Get(int Id)
        //        {
        //            var CurrentUser = await _userManager.GetUserAsync(User);

        //            return await _classificationProvider.GetClassificationById(Id, 1);// CurrentUser.LanguageId));

        //        }
        //        [HttpPut]
        //        public ClassificationUpdatePut Put(ClassificationUpdatePut Classification)
        //        {

        ////            var CurrentUser = await _userManager.GetUserAsync(User);

        //             _classificationProvider.PutClassification(Classification);
        //            return Classification;
        //        }

       
    }
}