using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SIPx.MVC.Models;

namespace SIPx.MVC.Controllers
{
    public class HomeController : Controller
    {
        
       
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
    }
}
