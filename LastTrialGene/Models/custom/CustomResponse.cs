using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LastTrialGene.Models.custom
{
    public class CustomResponse
    {
        public string status { get; set; }
        public string message { get; set; }
        public ClientDetailsData data { get; set; }
    }
}