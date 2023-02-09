using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LastTrialGene.Models.custom
{
    public class CustomObject
    {

        public CustomObject()
        {
        }
        public CustomObject(string ID)
        {
            this.ID = ID;
        }

        public CustomObject(string server, string user, string password, string ClientID)
        {
            this.server = server;
            this.user = user;
            this.password = password;
            this.database = database;
            this.ClientID = ClientID;
        }
        public string server { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public string database { get; set; }
        public string ClientID { get; set; }
        public string ID { get; set; }


    }
}