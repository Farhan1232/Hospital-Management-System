// Controllers/AccountController.cs
using Microsoft.AspNetCore.Mvc;
using HospitalManagement.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;

namespace HospitalManagement.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (model.Username == "doctor" && model.Password == "doctor123")
                {
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, "doctor"),
                        new Claim(ClaimTypes.Role, "Doctor")
                    };

                    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var principal = new ClaimsPrincipal(identity);
                    
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
                    
                    return RedirectToAction("Index", "Doctors");
                }
                else if (model.Username == "receptionist" && model.Password == "receptionist123")
                {
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, "receptionist"),
                        new Claim(ClaimTypes.Role, "Receptionist")
                    };

                    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var principal = new ClaimsPrincipal(identity);
                    
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
                    
                    return RedirectToAction("Index", "Patients");
                }
                else
                {
                    ModelState.AddModelError("", "Invalid username or password");
                }
            }
            return View(model);
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }
    }
}