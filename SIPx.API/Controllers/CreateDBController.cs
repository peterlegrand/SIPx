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
using System.Security.Claims;

namespace SIPx.API.Controllers
{
    public class CreateDBController : Controller
    {
        private readonly UserManager<SipUser> _userManager;
        private readonly ISqlDataAccess _sqlDataAccess;
        private readonly RoleManager<SipRole> _roleManager;

        public CreateDBController(UserManager<SipUser> userManager, ISqlDataAccess sqlDataAccess, RoleManager<SipRole> roleManager)
        {
            _userManager = userManager;
            _sqlDataAccess = sqlDataAccess;
            _roleManager = roleManager;
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
            using (StreamReader sr = new StreamReader("SQLScripts\\02ZCreateDataBase.sql", System.Text.Encoding.UTF8))
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
                using StreamReader sr = new StreamReader($"SQLScripts\\USP\\{file.Name}", System.Text.Encoding.UTF8);
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\04aUITerms.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\04bSecurityLevel.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }


            var identityUser = new SipUser
            {
                Email = "eplegrand@gmail.com",
                UserName = "eplegrand@gmail.com",
            //    FirstName = "Peter",
            //    LastName = "le Grand",
            //    LanguageId = 41,
            SecurityLevelId = 10,
                CreatedDate = DateTime.Now,
                ModifiedDate = DateTime.Now
            };
            await _userManager.CreateAsync(identityUser, "Pipo!9165");

            var identityUser2 = new SipUser
            {
                Email = "FordPrefect@gmail.com",
                UserName = "FordPrefect@gmail.com",
                //    FirstName = "Peter",
                //    LastName = "le Grand",
                //    LanguageId = 41,
                SecurityLevelId = 5,
                CreatedDate = DateTime.Now,
                ModifiedDate = DateTime.Now
            };
            await _userManager.CreateAsync(identityUser2, "Pipo!9165");

            using (StreamReader sr = new StreamReader("SQLScripts\\05MasterData.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }

            SipRole Role = new SipRole
            {
                Name = "Admin",
                RoleGroupId = 1,
                CanAssignContentOwnership = true,
                CanReceiveContentOwnership = true,
                CanAssignContentRead = true,
                CanReceiveContentRead = true,
                CanAssignContentEdit = true,
                CanReceiveContentEdit =true
            };
            await _roleManager.CreateAsync(Role);
            using (StreamReader sr = new StreamReader($"SQLScripts\\ApplicationRights.txt", System.Text.Encoding.UTF8))
            {
                while (!sr.EndOfStream)
                {
                    string line = await sr.ReadLineAsync();
                    await _roleManager.AddClaimAsync(Role, new Claim("ApplicationRight", line));
                }
            }
            using (StreamReader sr = new StreamReader($"SQLScripts\\OrganizationClaim.txt", System.Text.Encoding.UTF8))
            {
                while (!sr.EndOfStream)
                {
                    string line = await sr.ReadLineAsync();
                    await _roleManager.AddClaimAsync(Role, new Claim("OrganizationRight", line));
                }
            }
            using (StreamReader sr = new StreamReader($"SQLScripts\\ProjectClaim.txt", System.Text.Encoding.UTF8))
            {
                while (!sr.EndOfStream)
                {
                    string line = await sr.ReadLineAsync();
                    await _roleManager.AddClaimAsync(Role, new Claim("ProjectRight", line));
                }
            }


            await _userManager.AddToRoleAsync(identityUser, "Admin");

            using (StreamReader sr = new StreamReader("SQLScripts\\06aMasterData.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\06bMVCUIScreens.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\06cMVCUITermScreens.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\06dErrorMessages.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            //using (StreamReader sr = new StreamReader("SQLScripts\\06dMVCUITermScreens.sql", System.Text.Encoding.UTF8))
            //{
            //    string line = await sr.ReadToEndAsync();
            //    await _sqlDataAccess.PopulateDataSIP(line);
            //}
            using (StreamReader sr = new StreamReader("SQLScripts\\07TermLanguage.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            using (StreamReader sr = new StreamReader("SQLScripts\\07DataDictionaryTables.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }

            using (StreamReader sr = new StreamReader("SQLScripts\\07DataDictionaryColumnTypes.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }

            using (StreamReader sr = new StreamReader("SQLScripts\\07DataDictionaryColumns.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }

            using (StreamReader sr = new StreamReader("SQLScripts\\Demo\\Demo.sql", System.Text.Encoding.UTF8))
            {
                string line = await sr.ReadToEndAsync();
                await _sqlDataAccess.PopulateDataSIP(line);
            }
            //using (StreamReader sr = new StreamReader("SQLScripts\\Demo\\DemoNL.sql", System.Text.Encoding.UTF8))
            //{
            //    string line = await sr.ReadToEndAsync();
            //    await _sqlDataAccess.PopulateDataSIP(line);
            //}

            return View();
        }
    }
}