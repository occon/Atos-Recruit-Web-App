using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace atos
{
    [ApiController]
    [Route("api/profile")]
    public class ProfileController : Controller
    {
        [HttpPost]
        public string Post()
        {
            string cs = @"Server=127.0.0.1;Port=3306;Database=atos_bd;Uid=root;password=g4e5f3Qh4#;";
            string preguntas = "Nada";
            //string respuesta = "Nada";
            //string tabla = "Nada";

            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = "SELECT JSON_ARRAYAGG(JSON_OBJECT('id_aplicante', id_aplicante, 'perfil', perfil)) from atos_bd.aplicante_Perfiles inner join atos_bd.Perfil on aplicante_Perfiles.id_perfil = Perfil.id_perfil;";
            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                //Console.WriteLine("{0}",rdr.GetString(0));
                preguntas = rdr.GetString(0);
                //respuesta = rdr.GetString(1);
                //tabla = pregunta + " " + respuesta;
            }
            return preguntas;
        }
    }
}

