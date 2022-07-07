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
    public class signinAppModel : PageModel
    {
        private readonly IConfiguration _configuration;

        public signinAppModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [BindProperty]
        public string fname { get; set; }
        [BindProperty]
        public string lname { get; set; }
        [BindProperty]
        public string email { get; set; }
        int id_aplicante;
        bool user_exists;

        public int boolToInt(bool var)
        {
            int var_int;
            return var_int = (var) ? 1 : 0;
        }

        public void OnPost()
        {
            Usuarios usr = new Usuarios();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE correo = '" + email + "';";
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    user_exists = true;
                    usr.nombre = reader["nombre"].ToString();
                    usr.apellido = reader["apellido"].ToString();
                    if(fname == usr.nombre & lname == usr.apellido)
                    {
                        id_aplicante = Convert.ToInt32(reader["id_aplicante"]);
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
                    else
                    {
                        ViewData["Mensaje"] = "This email is already in use. Please choose another one or rewrite your name.";

                    }
                }
            }
            if (!user_exists)
            {
                cmd.CommandText = "INSERT INTO atos_bd.Aplicante (`nombre`,`apellido`,`correo`,`cv_existe`, `vj_terminado`, `status_ap`) VALUES ('" + fname + "', '" + lname + "', '" + email + "', 0, 0, 0);";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE nombre = '" + fname + "' AND apellido = '" + lname + "' AND correo = '" + email + "';";
                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        id_aplicante = Convert.ToInt32(reader["id_aplicante"]);
                        usr.nombre = reader["nombre"].ToString();
                        Response.Redirect("mainNewApp?msj= Welcome, " + usr.nombre);
                    }
                }
            }
            HttpContext.Session.SetInt32("id_aplicante", id_aplicante);
            conexion.Dispose();


        }

        public void OnGet()
        {
        }
    }
}