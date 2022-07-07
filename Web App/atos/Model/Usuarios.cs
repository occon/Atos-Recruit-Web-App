using System;
namespace atos.Model
{
    public class Usuarios
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string correo { get; set; }
        public int perfil { get; set; }
        public bool cvExiste { get; set; }
        public bool videojuego { get; set; }
        public bool status { get; set; }
        public Usuarios()
        {
        }
    }
}
