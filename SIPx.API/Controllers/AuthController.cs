using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
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
        private  IUserService _userService;
        private  UserManager<SipUser> _userManager;
        private  IConfiguration _configuration;

        public AuthController(IUserService userService, UserManager<SipUser> userManager, IConfiguration configuration )
        {
            _userService = userService;
            _userManager = userManager;
            _configuration = configuration;
        }

        [HttpPost("Register")]
        public async Task<IActionResult> RegisterAsync([FromBody]RegisterViewModel model)
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
        public async Task<UserManagerResponse> LoginAsync([FromBody]LoginViewModel model)
        {
           
            var user = await _userManager.FindByEmailAsync(model.Email);
            if (ModelState.IsValid)
            {
                var result = await _userService.LoginUserAsync(model);

                if (result.IsSuccess)
                {
                    var claims = new[]
            {
                new Claim("Email", model.Email),
               // new Claim("FirstName", user.FirstName),
                //new Claim("LastName", user.LastName),
                new Claim(ClaimTypes.NameIdentifier, user.Id)
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