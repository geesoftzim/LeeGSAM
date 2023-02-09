using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LastTrialGene.Models
{
    public static class Dbconnection
    {
        static SqlConnection conn;
        public static string dbconnection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["GlobalConnectionString"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            // SqlConnection con = new SqlConnection(strcon);
            //conn = con.Open();
            return strcon;
        }
    }
}