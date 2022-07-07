using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace atos.Pages
{
    public class Pagina11Model : PageModel
    {
        [BindProperty]
        [Required(ErrorMessage = "Nombre es requerido")]
        public string Nombre { get; set; }

        public void OnGet()
        {
        }
        public void OnPost()
        {
            if (ModelState.IsValid)
            {
                Response.Redirect("Index");
            }
            else
            {
                //Instrucciones en BackEnd para forma no-valida }
            }
        }
    }
}
