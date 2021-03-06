﻿using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SIPx.API.Models;
using SIPx.API.Services;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly UserManager<SipUser> _userManager;
        private readonly IConfiguration _configuration;
        private readonly IHostingEnvironment _hostingEnvironment;

        public AuthController(IUserService userService, UserManager<SipUser> userManager, IConfiguration configuration, IHostingEnvironment hostingEnvironment)
        {
            _userService = userService;
            _userManager = userManager;
            _configuration = configuration;
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpPost("Register")]
        public async Task<IActionResult> RegisterAsync([FromBody] RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await _userService.RegisterUserAsync(model);

                if (result.IsSuccess)
                    return Ok(result); // Status Code: 200 

                return BadRequest(result);
            }

            return BadRequest("Some properties are not valid"); // Status code: 400
        }

        [HttpPost("Login")]
        public async Task<UserManagerResponse> LoginAsync([FromBody] LoginViewModel model)
        {
            //PETER TODO this has a second stuff for dev environment
            if (_hostingEnvironment.IsEnvironment("Development"))
            {

                var claims = new[]
        {
                new System.Security.Claims.Claim("Email", "eplegrand@gmail.com"),
                new System.Security.Claims.Claim(ClaimTypes.NameIdentifier, "a")
            };
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["AuthSettings:Key"]));

                var token = new JwtSecurityToken(
            issuer: _configuration["AuthSettings:Issuer"],
            audience: _configuration["AuthSettings:Audience"],
            claims: claims,
            expires: DateTime.Now.AddDays(30),
            signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256));
                string tokenAsString = new JwtSecurityTokenHandler().WriteToken(token);

                return new UserManagerResponse
                {
                    UserInfo = claims.ToDictionary(c => c.Type, c => c.Value),
                    Message = tokenAsString,
                    IsSuccess = true,
                    ExpireDate = token.ValidTo
                };
            }
            else
            {
                var user = await _userManager.FindByEmailAsync(model.Email);
                if (ModelState.IsValid)
                {
                    var result = await _userService.LoginUserAsync(model);

                    if (result.IsSuccess)
                    {
                        var claims = new[]
                {
                new System.Security.Claims.Claim("Email", model.Email),
               // new Claim("FirstName", user.FirstName),
                //new Claim("LastName", user.LastName),
                new System.Security.Claims.Claim(ClaimTypes.NameIdentifier, user.Id)
            };
                        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["AuthSettings:Key"]));

                        var token = new JwtSecurityToken(
                    issuer: _configuration["AuthSettings:Issuer"],
                    audience: _configuration["AuthSettings:Audience"],
                    claims: claims,
                    expires: DateTime.Now.AddDays(30),
                    signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256));
                        string tokenAsString = new JwtSecurityTokenHandler().WriteToken(token);

                        return new UserManagerResponse
                        {
                            UserInfo = claims.ToDictionary(c => c.Type, c => c.Value),
                            Message = tokenAsString,
                            IsSuccess = true,
                            ExpireDate = token.ValidTo
                        };
                    }

                    return new UserManagerResponse
                    {
                        Message = "There is no user with that Email address",
                        IsSuccess = false,
                    };
                }

                return new UserManagerResponse
                {
                    Message = "There is no user with that Email address",
                    IsSuccess = false,
                };
            }
        }
    }
}