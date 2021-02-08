using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using ADS.Classes;

namespace ADS.Classes
{
    public class DatabaseHelperClass
    {
        SQLiteConnection dbConn;

        //Create Tabble
        public async Task<bool> onCreate(string DB_PATH)
        {
            try
            {
                if (!CheckFileExists(DB_PATH).Result)
                {
                    using (dbConn = new SQLiteConnection(DB_PATH))
                    {
                        dbConn.CreateTable<Temas>();
                    }
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        private async Task<bool> CheckFileExists(string fileName)
        {
            try
            {
                var store = await Windows.Storage.ApplicationData.Current.LocalFolder.GetFileAsync(fileName);
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Retrieve the specific contact from the database.
        public Temas ReadTemas(int temasid)
        {
            using (var dbConn = new SQLiteConnection(App.DB_PATH))
            {
                var existingconact = dbConn.Query<Temas>("select * from Temas where id =" + temasid).FirstOrDefault();
                return existingconact;
            }
        }
        // Retrieve the all contact list from the database.
        public ObservableCollection<Temas> ReadTemas()
        {
            using (var dbConn = new SQLiteConnection(App.DB_PATH))
            {
                List<Temas> myCollection = dbConn.Table<Temas>().ToList<Temas>();
                ObservableCollection<Temas> TemasList = new ObservableCollection<Temas>(myCollection);
                return TemasList;
            }
        }

        //Update existing conatct
        //public void UpdateContact(Temas tema)
        //{
        //    using (var dbConn = new SQLiteConnection(App.DB_PATH))
        //    {
        //        var existingtema = dbConn.Query<Temas>("select * from Temas where id =" + tema.id).FirstOrDefault();
        //        if (existingtema != null)
        //        {
        //            existingtema.Titulo = tema.Titulo;
        //            existingtema.Texto = tema.Texto;
        //            dbConn.RunInTransaction(() =>
        //            {
        //                dbConn.Update(existingtema);
        //            });
        //        }
        //    }
        //}

        // Insert the new contact in the Contacts table.
        public void Insert(Temas newtema)
        {
            using (var dbConn = new SQLiteConnection(App.DB_PATH))
            {
                dbConn.RunInTransaction(() =>
                {
                    dbConn.Insert(newtema);
                });
            }
        }

        //Delete specific contact
        public void DeleteTema(int id)
        {
            using (var dbConn = new SQLiteConnection(App.DB_PATH))
            {
                var existingtema = dbConn.Query<Temas>("select * from Temas where Id =" + id).FirstOrDefault();
                if (existingtema != null)
                {
                    dbConn.RunInTransaction(() =>
                    {
                        dbConn.Delete(existingtema);
                    });
                }
            }
        }
        //Delete all contactlist or delete Contacts table
        public void DeleteAllContact()
        {
            using (var dbConn = new SQLiteConnection(App.DB_PATH))
            {
                //dbConn.RunInTransaction(() =>
                //   {
                dbConn.DropTable<Temas>();
                dbConn.CreateTable<Temas>();
                dbConn.Dispose();
                dbConn.Close();
                //});
            }
        }
    }
}
