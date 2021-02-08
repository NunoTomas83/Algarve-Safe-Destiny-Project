using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADS.Classes
{
    class Conteudo_Subtopicos
    {
         //The Id property is marked as the Primary Key
        [SQLite.PrimaryKey, SQLite.AutoIncrement]
        public int id_subtopicos { get; set; }
        public int id_conteudo { get; set; }
        public string codigo_idiomas { get; set; }
        public string visibilidade { get; set; }

        public Conteudo_Subtopicos()
        {
            //empty constructor
        }
        public Conteudo_Subtopicos(int id_subtopicos, int id_conteudo, string codigo_idiomas, string visibilidade)
        {
            this.id_subtopicos = id_subtopicos;
            this.id_conteudo = id_conteudo;
            this.codigo_idiomas = codigo_idiomas;
            this.visibilidade = visibilidade;
        }
    }
}
