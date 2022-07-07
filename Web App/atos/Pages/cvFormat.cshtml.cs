using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MySql.Data.MySqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http;

namespace atos.Pages
{
    public class cvFormatModel : PageModel
    {
        //public string id_aplicante { get; set; }

        private readonly IConfiguration _configuration;

        public cvFormatModel(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public int id_red;
        public void OnGet(string id_aplicante)
        {
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

            cmd.CommandText = "SELECT * FROM atos_bd.Aplicante_Habilidad WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ViewData["habilidad"] = reader["habilidad"].ToString();
                    ViewData["ha_porcentaje"] = reader["porcentaje"].ToString();
                }
            }

            cmd.CommandText = "SELECT Idioma.idioma, Aplicante_Idioma.porcentaje FROM atos_bd.Aplicante_Idioma INNER JOIN atos_bd.Idioma on Aplicante_Idioma.id_idioma = Idioma.id_idioma WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ViewData["idioma"] = reader["idioma"].ToString();
                    ViewData["id_porcentaje"] = reader["porcentaje"].ToString();
                }
            }

            cmd.CommandText = "SELECT Perfil.perfil FROM atos_bd.Aplicante_Perfiles INNER JOIN atos_bd.Perfil on Aplicante_Perfiles.id_perfil = Perfil.id_perfil WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ViewData["perfil"] = reader["perfil"].ToString();
                }
            }
            cmd.CommandText = "SELECT Aplicante_Redes.id_red, Redes_sociales.red_social, Aplicante_Redes.usuario FROM atos_bd.Aplicante_Redes INNER JOIN atos_bd.Redes_sociales on Aplicante_Redes.id_red = Redes_sociales.id_red WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    id_red = Convert.ToInt32(reader["id_red"]);
                    ViewData["red"] = reader["red_social"].ToString();
                    ViewData["usuario"] = reader["usuario"].ToString();
                }
            }
            if (id_red == 1)
            {
                ViewData["icon"] = "facebook";
            }
            else if (id_red == 2)
            {
                ViewData["icon"] = "twitter";
            }
            else if (id_red == 3)
            {
                ViewData["icon"] = "instagram";
            }
            else if (id_red == 4)
            {
                ViewData["icon"] = "linkedin";
            }
            else if (id_red == 5)
            {
                ViewData["icon"] = "github";
            }

            cmd.CommandText = "SELECT * FROM atos_bd.Entidad_Educativa WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ViewData["entidad_educativa"] = reader["entidad_educativa"].ToString();
                    ViewData["localidad"] = reader["localidad"].ToString();
                    ViewData["carrera"] = reader["carrera"].ToString();
                    ViewData["campo_estudio"] = reader["campo_estudio"].ToString();
                    ViewData["mes_fin"] = reader["mes_fin"].ToString();
                    ViewData["anio_fin"] = reader["anio_fin"].ToString();
                }
            }

            cmd.CommandText = "SELECT Info_personal.nacimiento, Edo_civil.edo_civil, Genero.genero, Nacionalidad.nacionalidad, Info_personal.direccion, Info_personal.zip_code, Info_personal.ciudad, Info_personal.estado, Pais.pais, Info_personal.telefono, Info_personal.sobre_mi " +
                              "FROM atos_bd.Info_personal " +
                              "INNER JOIN atos_bd.Edo_civil on Info_personal.id_edocivil = Edo_civil.id_edocivil " +
                              "INNER JOIN atos_bd.Genero on Info_personal.id_genero = Genero.id_genero " +
                              "INNER JOIN atos_bd.Nacionalidad on Info_personal.id_nacionalidad = Nacionalidad.id_nacionalidad " +
                              "INNER JOIN atos_bd.Pais on Info_personal.id_pais = Pais.id_pais " +
                              "WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    string birthDate = reader["nacimiento"].ToString();
                    int i = birthDate.IndexOf(' ');
                    birthDate = birthDate.Substring(0,i);
                    ViewData["nacimiento"] = birthDate;
                    ViewData["edo_civil"] = reader["edo_civil"].ToString();
                    ViewData["genero"] = reader["genero"].ToString();
                    ViewData["nacionalidad"] = reader["nacionalidad"].ToString();
                    ViewData["direccion"] = reader["direccion"].ToString();
                    ViewData["zip_code"] = reader["zip_code"].ToString();
                    ViewData["ciudad"] = reader["ciudad"].ToString();
                    ViewData["estado"] = reader["estado"].ToString();
                    ViewData["pais"] = reader["pais"].ToString();
                    ViewData["telefono"] = reader["telefono"].ToString();
                    ViewData["sobre_mi"] = reader["sobre_mi"].ToString();
                }
            }

            cmd.CommandText = "SELECT Experiencia.puesto, Experiencia.descripcion, Experiencia.empresa, Experiencia.ciudad, Pais.pais, Experiencia.mes_inicio, Experiencia.anio_inicio, Experiencia.mes_fin, Experiencia.anio_fin FROM atos_bd.Experiencia INNER JOIN atos_bd.Pais on Experiencia.id_pais = Pais.id_pais WHERE id_aplicante = " + id_aplicante;
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    ViewData["puesto"] = reader["puesto"].ToString();
                    ViewData["descripcion"] = reader["descripcion"].ToString();
                    ViewData["empresa"] = reader["empresa"].ToString();
                    ViewData["emp_ciudad"] = reader["ciudad"].ToString();
                    ViewData["emp_pais"] = reader["pais"].ToString();
                    ViewData["mes_inicio"] = reader["mes_inicio"].ToString();
                    ViewData["anio_inicio"] = reader["anio_inicio"].ToString();
                    ViewData["mes_fin"] = reader["mes_fin"].ToString();
                    ViewData["anio_fin"] = reader["anio_fin"].ToString();

                }
            }



            conexion.Dispose();

        }
    }
}
