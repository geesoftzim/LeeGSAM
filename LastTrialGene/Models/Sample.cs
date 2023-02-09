using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LastTrialGene.Models
{
    public class Sample
    {

        public class Jresponse
        {
            public string status { get; set; }
            public string message { get; set; }
            public Data data { get; set; }
        }

        public class Data
        {
            public int ClientID { get; set; }
        }

    }
}