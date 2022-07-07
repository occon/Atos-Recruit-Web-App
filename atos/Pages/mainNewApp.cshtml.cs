using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace atos.Pages
{
    public class mainNewAppModel : PageModel
    {
        public void OnGet(string msj)
        {
            ViewData["msj"] = msj;
        }
    }
}
