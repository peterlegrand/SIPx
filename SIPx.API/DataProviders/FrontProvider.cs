﻿
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class FrontProvider : IFrontProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<FrontIndexGetPanels>> FrontIndexPanels(string UserId, int PageId)
        {
            string usp = "usp_FrontIndexPanels @UserId, @PageID";
            var x = await _sqlDataAccess.LoadData<FrontIndexGetPanels, dynamic>(usp, new { UserId = UserId, PageId = PageId });
            return x;
        }
         
        public async Task<List<AppointmentData>> FrontIndexPersonalCalendar(string UserId)
        {
            string usp = "usp_personalCalendar @UserId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AppointmentData>> FrontIndexOrganizationCalendar(string UserId)
        {
            string usp = "usp_personalOrganizationCalendar @UserId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AppointmentData>> FrontIndexProjectCalendar(string UserId)
        {
            string usp = "usp_personalProjectCalendar @UserId";
            var x = await _sqlDataAccess.LoadData<AppointmentData, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AppointmentData>> FrontIndexEventCalendar()
        {
            string usp = "usp_EventCalendar";
            var x = await _sqlDataAccess.LoadData<AppointmentData>(usp);
            return x;
        }

        public Task<FrontIndexGetDashboard> FrontIndexGetDashboard(string UserId, int PageId)
        {
            string usp = "usp_FrontIndexGetDashboard @UserId, @PageId";
            return _sqlDataAccess.LoadSingleRecord<FrontIndexGetDashboard, dynamic>(usp, new { UserId = UserId, PageId = PageId });

        }
    }
}
