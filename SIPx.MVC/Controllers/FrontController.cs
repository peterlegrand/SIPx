using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPx.CallAPI;
using SIPx.Shared;
using Syncfusion.EJ2.QueryBuilder;

namespace SIPx.MVC.Controllers
{
    public class FrontController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public IActionResult FrontPage()
        {
            return View();
        }
        [HttpPost]
        public IActionResult FrontPage(int? id = 0)
        {
            var a = HttpContext.Items.First();
            return View();
        }

        public IActionResult QueryBuilder()
        {

            QueryBuilderRule rule = new QueryBuilderRule()
            {
                Condition = "and",
                Rules = new List<QueryBuilderRule>()
                {
                    new QueryBuilderRule { Label="Category", Field="Category", Type="string", Operator="equal", Value = new string[] { "Clothing" } },
                    new QueryBuilderRule { Condition="or", Rules = new List<QueryBuilderRule>() {
                        new QueryBuilderRule { Label="Transaction Type", Field="TransactionType", Type="boolean", Operator="equal", Value = "Income" },
                        new QueryBuilderRule { Label="Payment Mode", Field="PaymentMode", Type="string", Operator="equal", Value = "Cash" }
                    } },
                    new QueryBuilderRule { Label="Amount", Field="Amount", Type="number", Operator="equal", Value = 10 }
                }
            };

            List<object> template = new List<object>()
            {
                new { create = "categoryCreate", destroy = "categoryDestroy", write = "categoryWrite" },
                new { create = "paymentCreate", destroy = "paymentDestroy", write = "paymentWrite" },
                new { create = "transactionCreate", destroy = "transactionDestroy", write = "transactionWrite" },
                new { create = "amountCreate", destroy = "amountDestroy", write = "amountWrite" }
            };

            List<object> paymentOperator = new List<object> {
                new { key = "Equal", value = "equal" },
                new { key = "Not Equal", value = "notequal" }
            };

            List<object> transactionOperator = new List<object> {
                new { key = "Equal", value = "equal" },
                new { key = "Not Equal", value = "notequal" }
            };

            List<object> amountOperator = new List<object> {
                new { key = "Equal", value = "equal" },
                new { key = "Greater than", value = "greaterthan" },
                new { key = "Less than", value = "lessthan" },
                new { key = "Less than or equal", value = "lessthanorequal" },
                new { key = "Greater than or equal", value = "greaterthanorequal" },
                new { key = "Not equal", value = "notequal" }
            };

            ViewBag.rule = rule;
            ViewBag.paymentOperator = paymentOperator;
            ViewBag.transactionOperator = transactionOperator;
            ViewBag.amountOperator = amountOperator;
            ViewBag.template = template;
            //ViewBag.dataSource = QueryBuilderData.expenseData;
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> Index(int Id=1)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<FrontIndexPanels>>($"{_baseUrl}api/Front/Index/"+Id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Front/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}
