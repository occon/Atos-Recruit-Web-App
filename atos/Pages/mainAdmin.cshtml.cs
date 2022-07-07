using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using atos.Model;
using MySql.Data.MySqlClient;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http;

using System.Data;

namespace atos.Pages
{
    public class mainAdminModel : PageModel
    {

        [BindProperty]
        public int profile { get; set; }
        [BindProperty]
        public int status { get; set; }
        [BindProperty]
        public int order { get; set; }
        [BindProperty]
        public string search { get; set; }
        [BindProperty]
        public int id_aplicante { get; set; }

        private readonly IConfiguration _configuration;

        public mainAdminModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [BindProperty]
        public string id_admin { get; set; }
        public IList<GetApplicants> ListaUsuarios { get; set; }
        public IList<FormData> ListaPerfil { get; set; }
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
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_admin").ToString()) == false)
            {
                id_admin = HttpContext.Session.GetInt32("id_admin").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }

            ListaPerfil = new List<FormData>();

            Admin ad = new Admin();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            //cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE nombre = '" + fname + "' AND apellido = '" + lname + "' AND correo = '" + email + "';";
            cmd.CommandText = "Select * from Administrador WHERE id_admin = " + Convert.ToInt32(id_admin) + ";";

            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ad.nombre = reader["nombre"].ToString();
                    ad.apellido = reader["apellido"].ToString();
                    //ad.correo = reader["correo"].ToString();
                    //ListaUsuarios.Add(ad);
                }
            }
            ViewData["ad_nombre"] = ad.nombre;
            ViewData["ad_apellido"] = ad.apellido;

            cmd.CommandText = "SELECT * FROM atos_bd.Perfil";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData perfil = new FormData();
                    perfil.id = Convert.ToInt32(reader["id_perfil"]);
                    perfil.dato = reader["perfil"].ToString();
                    ListaPerfil.Add(perfil);
                }
            }

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getApplicants";
            ListaUsuarios = new List<GetApplicants>();

            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    GetApplicants getApp = new GetApplicants();
                    getApp.id = Convert.ToInt32(reader["id_aplicante"]);
                    getApp.nombre = reader["nombre"].ToString();
                    getApp.apellido = reader["apellido"].ToString();
                    getApp.perfil = reader["perfil"].ToString();
                    bStatus = Convert.ToBoolean(Convert.ToInt32(reader["status_ap"]));
                    getApp.status = booltoStatus(bStatus);
                    getApp.puntuacion = scoreStr(reader["puntuacion"].ToString());
                    
                    ListaUsuarios.Add(getApp);
                }
            }
            conexion.Dispose();

        }
        public void OnPostFilter()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_admin").ToString()) == false)
            {
                id_admin = HttpContext.Session.GetInt32("id_admin").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }
            ListaPerfil = new List<FormData>();

            Admin ad = new Admin();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            //cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE nombre = '" + fname + "' AND apellido = '" + lname + "' AND correo = '" + email + "';";
            cmd.CommandText = "Select * from Administrador WHERE id_admin = " + Convert.ToInt32(id_admin) + ";";

            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ad.nombre = reader["nombre"].ToString();
                    ad.apellido = reader["apellido"].ToString();
                    //ad.correo = reader["correo"].ToString();
                    //ListaUsuarios.Add(ad);
                }
            }
            ViewData["ad_nombre"] = ad.nombre;
            ViewData["ad_apellido"] = ad.apellido;

            cmd.CommandText = "SELECT * FROM atos_bd.Perfil";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData perfil = new FormData();
                    perfil.id = Convert.ToInt32(reader["id_perfil"]);
                    perfil.dato = reader["perfil"].ToString();
                    ListaPerfil.Add(perfil);
                }
            }
            cmd.CommandType = CommandType.StoredProcedure;
            //if (search != "")
            //{
            //    cmd.CommandText = "search";
            //    cmd.Parameters.AddWithValue("@s", search);
            //    cmd.ExecuteNonQuery();
            //}
            if (profile != 0)
            {
                cmd.CommandText = "filter_by_profile";
                cmd.Parameters.AddWithValue("@id_profile", profile);
                cmd.ExecuteNonQuery();
            }
            if(status != 0)
            {
                cmd.CommandText = "filter_by_status";
                cmd.Parameters.AddWithValue("@id_status", status-1);
                cmd.ExecuteNonQuery();
            }
            if (order != 0)
            {
                cmd.CommandText = "orderBy";
                cmd.Parameters.AddWithValue("@id_order", order);
                cmd.ExecuteNonQuery();
            }
            if (profile == 0 && status == 0 && order == 0)
            {
                cmd.CommandText = "getApplicants";
                cmd.ExecuteNonQuery();
            }
            ListaUsuarios = new List<GetApplicants>();
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    GetApplicants getApp = new GetApplicants();
                    getApp.id = Convert.ToInt32(reader["id_aplicante"]);
                    getApp.nombre = reader["nombre"].ToString();
                    getApp.apellido = reader["apellido"].ToString();
                    getApp.perfil = reader["perfil"].ToString();
                    //getApp.perfil = (reader["perfil"].ToString() == "null") ? "-" : reader["perfil"].ToString();
                    bStatus = Convert.ToBoolean(Convert.ToInt32(reader["status_ap"]));
                    getApp.status = booltoStatus(bStatus);
                    getApp.puntuacion = scoreStr(reader["puntuacion"].ToString());
                    //getApp.puntuacion = (reader["puntuacion"].ToString() == null) ? scoreStr("0") : scoreStr(reader["puntuacion"].ToString());

                    ListaUsuarios.Add(getApp);
                }
            }
        }
        public void OnPostClear()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_admin").ToString()) == false)
            {
                id_admin = HttpContext.Session.GetInt32("id_admin").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }

            ListaPerfil = new List<FormData>();

            Admin ad = new Admin();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            //cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE nombre = '" + fname + "' AND apellido = '" + lname + "' AND correo = '" + email + "';";
            cmd.CommandText = "Select * from Administrador WHERE id_admin = " + Convert.ToInt32(id_admin) + ";";

            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ad.nombre = reader["nombre"].ToString();
                    ad.apellido = reader["apellido"].ToString();
                    //ad.correo = reader["correo"].ToString();
                    //ListaUsuarios.Add(ad);
                }
            }
            ViewData["ad_nombre"] = ad.nombre;
            ViewData["ad_apellido"] = ad.apellido;

            cmd.CommandText = "SELECT * FROM atos_bd.Perfil";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData perfil = new FormData();
                    perfil.id = Convert.ToInt32(reader["id_perfil"]);
                    perfil.dato = reader["perfil"].ToString();
                    ListaPerfil.Add(perfil);
                }
            }

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getApplicants";
            ListaUsuarios = new List<GetApplicants>();

            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    GetApplicants getApp = new GetApplicants();
                    getApp.id = Convert.ToInt32(reader["id_aplicante"]);
                    getApp.nombre = reader["nombre"].ToString();
                    getApp.apellido = reader["apellido"].ToString();
                    getApp.perfil = reader["perfil"].ToString();
                    bStatus = Convert.ToBoolean(Convert.ToInt32(reader["status_ap"]));
                    getApp.status = booltoStatus(bStatus);
                    getApp.puntuacion = scoreStr(reader["puntuacion"].ToString());

                    ListaUsuarios.Add(getApp);
                }
            }
            conexion.Dispose();

        }
        public void OnPostCv()
        {
            ListaPerfil = new List<FormData>();
            ListaUsuarios = new List<GetApplicants>();

            Response.Redirect("cvFormat?id_aplicante= "+ id_aplicante);
        }
    }
}
