using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using atos.Model;
using MySql.Data.MySqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http;


namespace atos.Pages
{
    public class loginAdModel : PageModel
    {
        private readonly IConfiguration _configuration;

        public loginAdModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [BindProperty]
        public string user { get; set; }
        [BindProperty]
        public string pwd { get; set; }
        int id_admin;

        public void OnPost()
        {

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = "SELECT * FROM atos_bd.Administrador WHERE user = '" + user + "' AND password = '" + pwd + "';";

            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    //ad.nombre = reader["nombre"].ToString();
                    //ad.apellido = reader["apellido"].ToString();
                    //ad_nombre = ad.nombre + "_" + ad.apellido;
                    //Response.Redirect("mainAdmin?ad_nombre=" + ad_nombre);
                    id_admin = Convert.ToInt32(reader["id_admin"]);
                    Response.Redirect("mainAdmin");
                }
                ViewData["Mensaje"] = "User and/or password are incorrect.";
                
            }
            HttpContext.Session.SetInt32("id_admin", id_admin);
            conexion.Dispose();
                
        }

        public void OnGet()
        {
        }
    }
}