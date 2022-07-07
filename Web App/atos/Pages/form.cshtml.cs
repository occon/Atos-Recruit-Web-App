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
    public class formModel : PageModel
    {
        private readonly IConfiguration _configuration;

        public formModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [BindProperty]
        public string fname { get; set; }
        [BindProperty]
        public string middleName { get; set; }
        [BindProperty]
        public string lName { get; set; }
        [BindProperty]
        public string sLName { get; set; }
        [BindProperty]
        public int maritalState { get; set; }
        [BindProperty]
        public int nationality { get; set; }
        [BindProperty]
        public string birthDate { get; set; }
        [BindProperty]
        public int gender { get; set; }
        [BindProperty]
        public int profile { get; set; }
        [BindProperty]
        public string email { get; set; }
        [BindProperty]
        public double phoneNum { get; set; }
        [BindProperty]
        public string address { get; set; }
        [BindProperty]
        public int zipCode { get; set; }
        [BindProperty]
        public string addCity { get; set; }
        [BindProperty]
        public string addState { get; set; }
        [BindProperty]
        public int addCountry { get; set; }
        [BindProperty]
        public int socialNet { get; set; }
        [BindProperty]
        public string usernameSM { get; set; }
        [BindProperty]
        public string schoolName { get; set; }
        [BindProperty]
        public string schoolLocation { get; set; }
        [BindProperty]
        public string degree { get; set; }
        [BindProperty]
        public string studyField { get; set; }
        [BindProperty]
        public int gradMonth { get; set; }
        [BindProperty]
        public int gradYear { get; set; }
        [BindProperty]
        public string jobName { get; set; }
        [BindProperty]
        public string jobCompany { get; set; }
        [BindProperty]
        public string jobCity { get; set; }
        [BindProperty]
        public int jobCountry { get; set; }
        [BindProperty]
        public int jStartMonth { get; set; }
        [BindProperty]
        public int jStartYear { get; set; }
        [BindProperty]
        public int jEndMonth { get; set; }
        [BindProperty]
        public int jEndYear { get; set; }
        [BindProperty]
        public string jobDesc { get; set; }
        [BindProperty]
        public string skillName { get; set; }
        [BindProperty]
        public int skillProff { get; set; }
        [BindProperty]
        public string language { get; set; }
        [BindProperty]
        public int languageProff { get; set; }
        [BindProperty]
        public string programName { get; set; }
        [BindProperty]
        public int programProff { get; set; }
        [BindProperty]
        public string aboutMe { get; set; }
        [BindProperty]
        public string id_aplicante { get; set; }


        public IList<FormData> ListaEdoCivil { get; set; }
        public IList<FormData> ListaNacionalidad { get; set; }
        public IList<FormData> ListaPais { get; set; }
        public IList<FormData> ListaIdioma { get; set; }
        public IList<FormData> ListaRedSocial { get; set; }
        public IList<FormData> ListaGenero { get; set; }
        public IList<FormData> ListaPerfil { get; set; }



        public void OnPost()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("id_aplicante").ToString()) == false)
            {
                id_aplicante = HttpContext.Session.GetInt32("id_aplicante").ToString();
            }
            else
            {
                Response.Redirect("Error");
            }
            ListaEdoCivil = new List<FormData>();
            ListaNacionalidad = new List<FormData>();
            ListaPais = new List<FormData>();
            ListaIdioma = new List<FormData>();
            ListaRedSocial = new List<FormData>();
            ListaGenero = new List<FormData>();
            ListaPerfil = new List<FormData>();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;

            cmd.CommandText = "INSERT INTO atos_bd.Info_personal(`id_aplicante`,`nacimiento`,`id_edocivil`,`id_genero`,`id_nacionalidad`,`direccion`,`zip_code`,`ciudad`,`estado`,`id_pais`,`telefono`,`sobre_mi`,`segundo_Nombre`,`segundo_Apellido`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + ",'" + birthDate + "'," + maritalState + "," + gender + "," + nationality + ",'" + address + "'," + zipCode + ",'" + addCity + "','" + addState + "'," + addCountry + "," + phoneNum + ",'" + aboutMe + "','" + middleName + "','" + sLName + "'); " +
                              "INSERT INTO atos_bd.Aplicante_Perfiles(`id_aplicante`,`id_perfil`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + "," + profile + "); " +
                              "INSERT INTO atos_bd.Aplicante_Redes(`id_aplicante`,`id_red`,`usuario`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + "," + socialNet + ",'" + usernameSM + "'); " +
                              "INSERT INTO atos_bd.Entidad_Educativa(`id_aplicante`,`entidad_educativa`,`localidad`,`carrera`, `campo_estudio`, `mes_fin`, `anio_fin`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + ",'" + schoolName + "','" + schoolLocation + "','" + degree + "','" + studyField + "'," + gradMonth + "," + gradYear + "); " +
                              "INSERT INTO atos_bd.Experiencia(`id_aplicante`,`puesto`,`descripcion`,`empresa`,`ciudad`,`id_pais`,`mes_inicio`,`anio_inicio`,`mes_fin`,`anio_fin`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + ",'" + jobName + "','" + jobDesc + "','" + jobCompany + "','" + jobCity + "','" + jobCountry + "'," + jStartMonth + "," + jStartYear + "," + jEndMonth + "," + jEndYear + "); " +
                              "INSERT INTO atos_bd.Aplicante_Habilidad(`id_aplicante`,`habilidad`,`porcentaje`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + ",'" + skillName + "'," + skillProff + "); " +
                              "INSERT INTO atos_bd.Aplicante_Idioma(`id_aplicante`,`id_idioma`,`porcentaje`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + "," + language + "," + languageProff + "); " +
                              "UPDATE `atos_bd`.`Aplicante` SET `cv_existe` = '1' WHERE (`id_aplicante` = " + Int32.Parse(id_aplicante) + ");" +
                              "INSERT INTO atos_bd.Juego(`id_aplicante`, `id_perfil`, `puntuacion`) " +
                              "VALUES(" + Int32.Parse(id_aplicante) + "," + profile + ",0)";

;
            cmd.ExecuteNonQuery();
            conexion.Dispose();
            Response.Redirect("mainApp");
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
            ViewData["id"] = id_aplicante;
            ListaEdoCivil = new List<FormData>();
            ListaNacionalidad = new List<FormData>();
            ListaPais = new List<FormData>();
            ListaIdioma = new List<FormData>();
            ListaRedSocial = new List<FormData>();
            ListaGenero = new List<FormData>();
            ListaPerfil = new List<FormData>();

            string connectionString = _configuration.GetConnectionString("atosDB");
            MySqlConnection conexion = new MySqlConnection(connectionString);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = "SELECT * FROM atos_bd.Aplicante WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ViewData["nombre"] = reader["nombre"].ToString();
                    ViewData["apellido"] = reader["apellido"].ToString();
                    ViewData["correo"] = reader["correo"].ToString();
                }
            }
            cmd.CommandText = "SELECT * FROM atos_bd.Edo_civil";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData edoCivil = new FormData();
                    edoCivil.id = Convert.ToInt32(reader["id_edocivil"]);
                    edoCivil.dato = reader["edo_civil"].ToString();
                    ListaEdoCivil.Add(edoCivil);
                }
            }
            cmd.CommandText = "SELECT * FROM atos_bd.Nacionalidad";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData nacionalidad = new FormData();
                    nacionalidad.id = Convert.ToInt32(reader["id_nacionalidad"]);
                    nacionalidad.dato = reader["nacionalidad"].ToString();
                    ListaNacionalidad.Add(nacionalidad);
                }
            }
            cmd.CommandText = "SELECT * FROM atos_bd.Pais";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData pais = new FormData();
                    pais.id = Convert.ToInt32(reader["id_pais"]);
                    pais.dato = reader["pais"].ToString();
                    ListaPais.Add(pais);
                }
            }
            cmd.CommandText = "SELECT * FROM atos_bd.Idioma";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData idioma = new FormData();
                    idioma.id = Convert.ToInt32(reader["id_idioma"]);
                    idioma.dato = reader["idioma"].ToString();
                    ListaIdioma.Add(idioma);
                }
            }
            cmd.CommandText = "SELECT * FROM atos_bd.Redes_sociales";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData redesSociales = new FormData();
                    redesSociales.id = Convert.ToInt32(reader["id_red"]);
                    redesSociales.dato = reader["red_social"].ToString();
                    ListaRedSocial.Add(redesSociales);
                }
            }
            cmd.CommandText = "SELECT * FROM atos_bd.Genero";
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    FormData genero = new FormData();
                    genero.id = Convert.ToInt32(reader["id_genero"]);
                    genero.dato = reader["genero"].ToString();
                    ListaGenero.Add(genero);
                }
            }
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
        }
    }
}