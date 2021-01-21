using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.StaticFiles;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ImageController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ImageController(IHostingEnvironment hostingEnvironment
            , IMasterProvider masterProvider
            , IMasterListProvider masterListProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IClassificationProvider classificationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _hostingEnvironment = hostingEnvironment;
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpPost]
        public IActionResult Post(FileUpload model)
        {
            if (new FileExtensionContentTypeProvider().TryGetContentType(model.FileName, out var contentType))
            {

                System.IO.File.WriteAllBytes("c:\\backup\\Foo.txt", model.FileBytes);
                // This is the point where we should persist the image bytes to a persistent store.
                // This could be anything from storing the image in a database (MySql, SqlServer), disk,
                // or object store (Amazon S3, Azure Blog Storage, Digital Ocean Spaces)

                // Once the image is stored, we'll want to return the url of where the image is stored
                // in the response. For the time being, this image url will be hardcoded so that the
                // TinyMCE editor functions.
                string imageUrl = "https://dustyhoppe-blog-images-prod.sfo2.cdn.digitaloceanspaces.com/cat-image-qf76g35k.jpg";
                return Ok(new { imageUrl });
            }

            return UnprocessableEntity(new { Message = $"Cannot determine content type for file '{model.FileName}'." });
        }

        [HttpPost("UploadFile")]
//        public async Task<IActionResult> UploadFile(ByteArrayContent file)
        public async Task<IActionResult> UploadFile([FromBody] FileUploadModel file)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            string fName = @"C:\backup\";
            //            FileInfo fi = new FileInfo(file.FileName);
            var newfilename = "dabc";
//            var newfilename = DateTime.Now.ToString("yyyyMMddHHmmssfff") + fi.Extension;
  //          var fNamePAth = fName + newfilename;
 
            return Ok(new { newfilename });

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            { }
            }



            //[HttpPost("UploadFileOld")]
            //public async Task<IActionResult> UploadFileOld([FromForm] IFormFile file)
            //{
            //    var CurrentUser = await _userManager.GetUserAsync(User);

            //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            //    {
            //        string fName = file.FileName;
            //        string path = Path.Combine(_hostingEnvironment.ContentRootPath, "wwwroot\\images\\" + file.FileName);
            //        using (var stream = new FileStream(path, FileMode.Create))
            //        {
            //            await file.CopyToAsync(stream);
            //        }
            //        return Ok(file.FileName);
            //    }
            //    return BadRequest(new
            //    {
            //        IsSuccess = false,
            //        Message = "No rights",
            //    });
            //}


            //[HttpPost("Update")]
            //public async Task<IActionResult> Update(ClassificationUpdateGet Classification)
            //{
            //    var CurrentUser = await _userManager.GetUserAsync(User);
            //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            //    {
            //        Classification.UserId= CurrentUser.Id;
            //        //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
            //        //if (CheckString.Length == 0)
            //        //{
            //            _classificationProvider.UpdatePost(Classification);
            //            return Ok(Classification);
            //        //}
            //        return BadRequest(new
            //        {
            //            IsSuccess = false,
            //            //Message = CheckString,
            //        });

            //    }
            //    return BadRequest(new
            //    {
            //        IsSuccess = false,
            //        Message = "No rights",
            //    });

            //}
        }
}