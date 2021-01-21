using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Serialization.Formatters.Binary;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.Shared;

namespace SIPx.MVC.Controllers
{
    [Produces("application/json")]
    [Route("api/image")]
    [ApiController]
    public class ImageController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        //        private readonly IHostingEnvironment _hostingEnvironment;
        readonly ServiceClient _client = new ServiceClient();

        public ImageController(IConfiguration configuration) //, IHostingEnvironment hostingEnvironment)
        {
            _configuration = configuration;
            //          _hostingEnvironment = hostingEnvironment;
        }

        [HttpPost]
        public IActionResult Post(FileUpload model)
        {
            if (new FileExtensionContentTypeProvider().TryGetContentType(model.FileName, out var contentType))
            {

                string fileName = DateTime.Now.ToString("yyyyMMddHHmmssfff")+ Path.GetExtension(model.FileName);
                string fullPath = "C:\\Users\\epleg\\source\\repos\\peterlegrand\\SIPx\\SIPx.MVC\\wwwroot\\images\\" + fileName;
                System.IO.File.WriteAllBytes(fullPath, model.FileBytes);
                // This is the point where we should persist the image bytes to a persistent store.
                // This could be anything from storing the image in a database (MySql, SqlServer), disk,
                // or object store (Amazon S3, Azure Blog Storage, Digital Ocean Spaces)
                //                var x = new IFormFile();

                // Once the image is stored, we'll want to return the url of where the image is stored
                // in the response. For the time being, this image url will be hardcoded so that the
                // TinyMCE editor functions.
                string imageUrl = "https://localhost:44358/images/"+fileName ;
//                imageUrl = "https://dustyhoppe-blog-images-prod.sfo2.cdn.digitaloceanspaces.com/cat-image-qf76g35k.jpg";
                return Ok(new { imageUrl });
            }

            return UnprocessableEntity(new { Message = $"Cannot determine content type for file '{model.FileName}'." });
        }
    }
}
        //[HttpPost]

        //public IActionResult Post2()
        //{
        //    string fileName = "";   
        //    string folderName = "files/";
        //    Microsoft.AspNetCore.Http.IFormFile file;
        //    try
        //    {
        //        file = Request.Form.Files[0];
        //        string webRootPath = _hostingEnvironment.WebRootPath;
        //        string newPath = Path.Combine(webRootPath, folderName);
        //        if (!Directory.Exists(newPath))
        //        {
        //            Directory.CreateDirectory(newPath);
        //        }
        //        if (file.Length > 0)
        //        {
        //            fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
        //            string fullPath = Path.Combine(newPath, fileName);
        //            using (var stream = new FileStream(fullPath, FileMode.Create))
        //            {
        //                file.CopyTo(stream);
        //            }
        //        }
        //        return Ok(fileName);
        //    }
        //    catch (System.Exception ex)
        //    {
        //        return Ok("hi" );
        //        //return Json(@"HTTP / 1.1 500 Server Error + ex.Message");
        //    }
        //}



