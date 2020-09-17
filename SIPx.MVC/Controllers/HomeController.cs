using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SIPx.MVC.Models;

namespace SIPx.MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly IConfiguration _configuration;
        private IHostingEnvironment hostingEnv;
        public HomeController(IHostingEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            hostingEnv = env;

        }

        public IActionResult Index()
        {
            Assembly asm = Assembly.GetExecutingAssembly();
            string z = "";
            var x = asm.GetTypes();
                //.Where(type => typeof(Controller).IsAssignableFrom(type)) //filter controllers
                //.SelectMany(type => type.GetMethods())
                //.Where(method => method.IsPublic && !method.IsDefined(typeof(NonActionAttribute)));


            foreach (Type tc in x)

            {

                if (tc.IsAbstract)

                {

//                    z+= " Abstract Class : " + tc.Name + "<br>";

                }

                else if (tc.IsPublic)

                {

                    z += "Public Class : " + tc.Name + " : " + tc.Namespace + "<br>";

                }

                else if (tc.IsSealed)

                {

                  //  z += "Sealed Class : " + tc.Name + Environment.NewLine;

                }



                //Get List of Method Names of Class

                MemberInfo[] methodName = tc.GetMethods();



                foreach (MemberInfo method in methodName)

                {

                    if (method.ReflectedType.IsPublic && (method.Name.ToString() == "Create" || method.Name.ToString() == "Edit" || method.Name.ToString() == "Delete" || method.Name.ToString() == "Index"))

                    {

                        z += "Public Method : " + method.Name.ToString()  

                            + "<br>";

                    }

                    else

                    {

                   //     z += "Non-Public Method : " + method.Name.ToString() + Environment.NewLine;

                    }
                }

            }


            //foreach(var y in x)
            //{
            //    z += ":"+ y.Name;
            //}
            ViewBag.Classlist = z;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public ActionResult SaveFile(IList<IFormFile> UploadFiles)
        {
            string HtmlString = string.Empty;
            if (UploadFiles != null)
            {
                foreach (var file in UploadFiles)
                {
                    //Below is the code for Saving the image to Azure Blob Storage
                    //string blobstorageconnection = _configuration.GetValue<string>("blobstorage");
                    //byte[] dataFiles;
                    //CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobstorageconnection);
                    //CloudBlobClient cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();
                    //CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("filescontainers");

                    //BlobContainerPermissions permissions = new BlobContainerPermissions
                    //{
                    //    PublicAccess = BlobContainerPublicAccessType.Blob
                    //};
                    //string systemFileName = file.FileName;
                    //cloudBlobContainer.SetPermissionsAsync(permissions);
                    //using (var target = new MemoryStream())
                    //{
                    //    file.CopyTo(target);
                    //    dataFiles = target.ToArray();
                    //}
                    string filename = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    filename = hostingEnv.WebRootPath + "\\files" + $@"\{filename}";
                    if (!System.IO.File.Exists(filename))
                    {
                        using (FileStream fs = System.IO.File.Create(filename))
                        {
                            file.CopyTo(fs);
                            fs.Flush();
                        }
                    }
                    else
                    {
                        Response.Clear();
                        Response.StatusCode = 204;
                        Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = "File already exists.";
                    }
                }
            }
            return Content("");
        }

    }
}
