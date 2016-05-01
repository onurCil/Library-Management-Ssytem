using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class DBClass
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString);//LibraryConnectionString-->>web.config de verdiğin isimle aynı olmalı.
        static SqlCommand cmd;//sql deki gönderceğimiz query i içinde tutuyor,commad le gönderdik isteği ama adaptere tutuyoruz.
        static SqlDataAdapter selectAdapter;//gelen veriyi burda tutuyoruz

        public DBClass()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void InsertCommand(string query)//name field ve city alcak
        {//Return yapılmaz.
            cmd = new SqlCommand(query, con);//queryi connectionla bagladım bunda parametre 
            //gondermelısın ınsert edıyoruz cunku select degıl
            con.Open();
            cmd.ExecuteNonQuery(); 
            con.Close();

        }

        public static DataSet SelectCommand(string query)
        {//Select Command bize return yapar.
            con.Open();
            DataSet tempSet = new DataSet();
            selectAdapter = new SqlDataAdapter(query, con);
            selectAdapter.Fill(tempSet);
            con.Close();
            return tempSet;
        }



    }
}
