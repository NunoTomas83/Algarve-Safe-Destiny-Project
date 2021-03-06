﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.Storage.Streams;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Media.Imaging;
using System.Runtime.InteropServices.WindowsRuntime;


namespace ADS.Classes
{
    public class Temas
    {
        //The Id property is marked as the Primary Key
        [SQLite.PrimaryKey, SQLite.AutoIncrement]
        public int id { get; set; }
        public string descricao { get; set; }
        public string visibilidade { get; set; }
        public string icone { get; set; }
        //public BitmapImage img { get; set; }

        public Temas()
        {
            //empty constructor
        }
        public Temas(string descricao, string visibilidade, string icone)
        {
            this.descricao = descricao;
            this.visibilidade = visibilidade;
            this.icone = icone;
        }

    }
}
