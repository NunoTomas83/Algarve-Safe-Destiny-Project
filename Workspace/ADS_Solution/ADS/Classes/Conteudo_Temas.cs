using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADS.Classes
{
    class Conteudo_Temas
    {
        [SQLite.PrimaryKey, SQLite.AutoIncrement]
        public int id_temas { get; set; }
        public int id_conteudo { get; set; }
        public string codigo_idiomas { get; set; }
        public string visibilidade { get; set; }
        //public BitmapImage img { get; set; }

        public Conteudo_Temas()
        {
            //empty constructor
        }
        public Conteudo_Temas(string visibilidade)
        {
            this.visibilidade = visibilidade;
        }
    }
}
