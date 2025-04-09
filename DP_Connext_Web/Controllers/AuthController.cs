using Microsoft.AspNetCore.Mvc;

namespace YourNamespace.Controllers
{
    public class AuthController : Controller
    {
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string Email, string Password)
        {
            // TODO: Implement authentication logic
            if (Email == "admin@example.com" && Password == "password")
            {
                return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "Invalid login credentials";
            return View();
        }
    }
}
