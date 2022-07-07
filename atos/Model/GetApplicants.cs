using System;
namespace atos.Model
{
    public class GetApplicants
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string perfil { get; set; }
        public string status { get; set; }
        public string puntuacion { get; set; }

        public GetApplicants()
        {
        }
    }
}
