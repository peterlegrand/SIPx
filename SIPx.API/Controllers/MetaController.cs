using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using SIPx.API.ViewModels;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    public class MetaController : Controller
    {
        private readonly IMetaProvider _metaProvider;

        public MetaController(IMetaProvider metaProvider)
        {
            _metaProvider = metaProvider;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> AddressTypes()
        {
            List<MetaListAddressType> MasterList = await _metaProvider.AddressTypes();
            return View(MasterList);
        }
        public async Task<IActionResult> Claims()
        {
            List<MetaListClaim> MasterList = await _metaProvider.Claims();
            return View(MasterList);
        }
        public async Task<IActionResult> ClaimGroups()
        {
            List<MetaListClaimGroup> MasterList = await _metaProvider.ClaimGroups();
            return View(MasterList);
        }
        public async Task<IActionResult> ContentStatuses()
        {
            List<MetaListContentStatus> MasterList = await _metaProvider.ContentStatuses();
            return View(MasterList);
        }
        public async Task<IActionResult> Countries()
        {
            List<MetaListCountry> MasterList = await _metaProvider.Countries();
            return View(MasterList);
        }
        public async Task<IActionResult> DateLevels()
        {
            List<MetaListDateLevel> MasterList = await _metaProvider.DateLevels();
            return View(MasterList);
        }
        public async Task<IActionResult> Genders()
        {
            List<MetaListGender> MasterList = await _metaProvider.Genders();
            return View(MasterList);
        }
        public async Task<IActionResult> Languages()
        {
            List<MetaListLanguage> MasterList = await _metaProvider.Languages();
            return View(MasterList);
        }
        public async Task<IActionResult> Regions()
        {
            List<MetaListRegion> MasterList = await _metaProvider.Regions();
            return View(MasterList);
        }
        public async Task<IActionResult> SecurityLevels()
        {
            List<MetaListSecurityLevel> MasterList = await _metaProvider.SecurityLevels();
            return View(MasterList);
        }
        public async Task<IActionResult> Settings()
        {
            List<MetaListSettings> MasterList = await _metaProvider.Settings();
            return View(MasterList);
        }
        public async Task<IActionResult> SortBys()
        {
            List<MetaListSortBy> MasterList = await _metaProvider.SortBys();
            return View(MasterList);
        }
        public async Task<IActionResult> Statuses()
        {
            List<MetaListStatus> MasterList = await _metaProvider.Statuses();
            return View(MasterList);
        }
        public async Task<IActionResult> SubRegions()
        {
            List<MetaListSubRegion> MasterList = await _metaProvider.SubRegions();
            return View(MasterList);
        }
        public async Task<IActionResult> TelecomTypes()
        {
            List<MetaListTelecomType> MasterList = await _metaProvider.TelecomTypes();
            return View(MasterList);
        }
        public async Task<IActionResult> ValueUpdateTypes()
        {
            List<MetaListValueUpdateType> MasterList = await _metaProvider.ValueUpdateTypes();
            return View(MasterList);
        }
    }
}
