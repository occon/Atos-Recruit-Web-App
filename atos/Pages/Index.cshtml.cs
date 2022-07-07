using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;
using MySql.Data.MySqlClient;
using Microsoft.Extensions.Configuration;
using atos.Model;

namespace atos.Pages
{
    public class IndexModel : PageModel
    {
        private readonly IConfiguration _configuration;

        public IndexModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public void OnGet()
        {

        }

        [BindProperty]
        public string id_aplicante { get; set; }

        public void OnPost()
        {
            id_aplicante = HttpContext.Session.GetInt32("id_aplicante").ToString();
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_aplicante").ToString()) == false)
            {
                Response.Redirect("signinApp?");
            }
            else
            {
                string connectionString = _configuration.GetConnectionString("atosDB");
                MySqlConnection conexion = new MySqlConnection(connectionString);
                conexion.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conexion;
                cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE id_aplicante = " + id_aplicante + ";";
                Usuarios usr = new Usuarios();

                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        usr.cvExiste = Convert.ToBoolean(Convert.ToInt32(reader["cv_existe"]));
                        if (!usr.cvExiste)
                        {
                            Response.Redirect("mainNewApp?msj= Welcome back, " + usr.nombre);
                        }
                        else
                        {
                            Response.Redirect("mainApp?msj= Welcome back, " + usr.nombre);
                        }
                    }
                }
            }
        }
    }
}
