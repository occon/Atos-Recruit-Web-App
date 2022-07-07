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
    [Route("api/score")]
    public class ScoreController : ControllerBase
    {
        // POST api/values
        [HttpPost]
        public void Post([FromForm] int id_aplicante, [FromForm] int puntuacion)
        {
            string cs = @"Server=127.0.0.1;Port=3306;Database=atos_bd;Uid=root;password=g4e5f3Qh4#;";
            //string respuesta = "Nada";
            //string tabla = "Nada";

            MySqlConnection conexion = new MySqlConnection(cs);
            conexion.Open();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion;

            //using MySqlDataReader rdr = cmd.ExecuteReader();

            cmd.CommandText = "UPDATE atos_bd.Juego SET puntuacion = " + puntuacion + " WHERE id_aplicante = " + id_aplicante + "; ";
            cmd.ExecuteNonQuery();
        }
    }
}

