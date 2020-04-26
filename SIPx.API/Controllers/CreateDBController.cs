using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SIPx.API.Models;
using SIPx.DataAccess;
using System.ServiceProcess;
namespace SIPx.API.Controllers
{
    public class CreateDBController : Controller
    {
        private readonly UserManager<SipUser> _userManager;
        private readonly IConfiguration _configuration;
        private readonly ISqlDataAccess _sqlDataAccess;

        public CreateDBController(UserManager<SipUser> userManager, IConfiguration configuration, ISqlDataAccess sqlDataAccess)
        {
            _userManager = userManager;
            _configuration = configuration;
            _sqlDataAccess = sqlDataAccess;
        }
        [HttpGet]
        public IActionResult Index()
        { return View(); }

        [HttpPost]
        public async Task<IActionResult> Index(int id)
        {
            var sqlService = new System.ServiceProcess.ServiceController("MSSQLSERVER");
            //  sqlService.ServiceName = ;
            if (sqlService.Status != ServiceControllerStatus.Stopped)
            { sqlService.Stop(); }

            sqlService.WaitForStatus(ServiceControllerStatus.Stopped);
            sqlService.Start();
            sqlService.WaitForStatus(ServiceControllerStatus.Running);

            using (StreamReader sr = new StreamReader("SQLScripts\\01CreateDataBase.sql" , System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataMaster(line);
            }

            using (StreamReader sr = new StreamReader("SQLScripts\\02CreateDataBase.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }

            using (StreamReader sr = new StreamReader("SQLScripts\\03CreateDataBase.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataMaster(line);
            }

            DirectoryInfo d = new DirectoryInfo("SQLScripts\\USP");
            FileInfo[] Files = d.GetFiles();
            foreach (FileInfo file in Files)
            {
                using (StreamReader sr = new StreamReader($"SQLScripts\\USP\\{file.Name}", System.Text.Encoding.UTF8))
                {
                    string line = await sr.ReadToEndAsync();
                    await _sqlDataAccess.PopulateDataSIP(line);
                }
            }

            var identityUser = new SipUser
            {
                Email = "eplegrand2@gmail.com",
                UserName = "eplegrand2@gmail.com",
                FirstName = "Peter",
                LastName = "le Grand",
                LanguageID = 41,
                CreatedDate = DateTime.Now,
                ModifiedDate = DateTime.Now

            };
            var result = await _userManager.CreateAsync(identityUser, "Pipo!9165");

            using (StreamReader sr = new StreamReader("SQLScripts\\04MasterData.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\Demo\\Demo.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\Demo\\DemoNL.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }


            return View();
        }
    }
}