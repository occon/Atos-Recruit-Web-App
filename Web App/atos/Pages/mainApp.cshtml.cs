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
using System.Data;

namespace atos.Pages
{
    public class mainAppModel : PageModel
    {

        private readonly IConfiguration _configuration;

        public mainAppModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [BindProperty]
        public string id_aplicante { get; set; }
        public IList<GetApplicants> ListaUsuarios { get; set; }

        bool bStatus;

        public string booltoStatus(bool var)
        {
            string str_var;
            return str_var = (var) ? "Done" : "On Progress";
        }

        public string scoreStr(string var)
        {
            string str_var;
            return str_var = (var == "0") ? "-/20" : var + " /20";
        }

        public void OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_aplicante").ToString()) == false)
            {
                id_aplicante = HttpContext.Session.GetInt32("id_aplicante").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }

            int progress;
            Usuarios usr = new Usuarios();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    usr.nombre = reader["nombre"].ToString();
                    usr.apellido = reader["apellido"].ToString();
                    usr.correo = reader["correo"].ToString();
                    usr.cvExiste = Convert.ToBoolean(Convert.ToInt32(reader["cv_existe"]));
                    usr.videojuego = Convert.ToBoolean(Convert.ToInt32(reader["vj_terminado"]));
                    usr.status = Convert.ToBoolean(Convert.ToInt32(reader["status_ap"]));
                }
            }
            ViewData["usr_nombre"] = usr.nombre;
            ViewData["usr_apellido"] = usr.apellido;
            ViewData["usr_correo"] = usr.correo;

            progress = 100;
            ViewData["color"] = "green";
            if (!usr.status)
            {
                progress = 50;
                ViewData["color"] = "#ffc72d";

            }
            ViewData["progress"] = progress;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getApplicant";
            cmd.Parameters.AddWithValue("@id", id_aplicante);
            cmd.ExecuteNonQuery();

            ListaUsuarios = new List<GetApplicants>();

            GetApplicants getApp = new GetApplicants();
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    getApp.perfil = reader["perfil"].ToString();
                    bStatus = Convert.ToBoolean(Convert.ToInt32(reader["status_ap"]));
                    getApp.status = booltoStatus(bStatus);
                    getApp.puntuacion = scoreStr(reader["puntuacion"].ToString());

                    ListaUsuarios.Add(getApp);
                }
            }

            ViewData["usr_perfil"] = getApp.perfil;
            ViewData["usr_score"] = getApp.puntuacion;
            conexion.Dispose();
        }

        public void OnPostCv()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_aplicante").ToString()) == false)
            {
                id_aplicante = HttpContext.Session.GetInt32("id_aplicante").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }
            Response.Redirect("cvFormat?id_aplicante= " + id_aplicante);
        }


        public void OnPostDel()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_aplicante").ToString()) == false)
            {
                id_aplicante = HttpContext.Session.GetInt32("id_aplicante").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion; cmd.CommandText = "delete from atos_bd.Aplicante_Habilidad where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Aplicante_Idioma where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Aplicante_Perfiles where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Aplicante_Redes where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Entidad_Educativa where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Experiencia where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Info_personal where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.juego where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from atos_bd.Aplicante where id_aplicante = " + Convert.ToInt32(id_aplicante) + ";";
            cmd.ExecuteNonQuery();
            conexion.Dispose();
            Response.Redirect("cvFormat?Index");

        }
    }
}
