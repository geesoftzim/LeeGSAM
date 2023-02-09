using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace LastTrialGene.Models
{
    public class SearchEntity
    {
        public class Entity
        {
            public string ID { get; set; }
            public int CounterpartyType { get; set; }
            public string ClientNo { get; set; }
            public string Name { get; set; }
            public int CustodialGroup { get; set; }
            public string PostalAddress { get; set; }
            public string PostalAddress2 { get; set; }
            public string PostalAddress3 { get; set; }
            public int PostalCity { get; set; }
            public int PostalCountry { get; set; }
            public string PhysicalAddress { get; set; }
            public string PhysicalAddress2 { get; set; }
            public string PhysicalAddress3 { get; set; }
            public int PhysicalCity { get; set; }
            public int PhysicalCountry { get; set; }
            public string EmailAddress { get; set; }
            public string PhoneNo { get; set; }
            public string PhoneNo2 { get; set; }
            public string FaxNo { get; set; }
            public string CustodialGroupName { get; set; }
            public string PostalCityName { get; set; }
            public string PostalCountryName { get; set; }
            public string PhysicalCityName { get; set; }
            public string PhysicalCountryName { get; set; }

            public List<Entity> Fill(string searchString)
            {
                try
                {
                    SearchEntityPost sep = new SearchEntityPost();
                    sep.server = "OPTIMUSPRIME";
                    sep.database = "GSAMUP";
                    sep.user = "debugger";
                    sep.password = "bug";
                    sep.SearchString = (searchString ?? "");
                    sep.Client = 1;

                    if (sep.SearchString != "")
                    {
                        var webClient = new WebClient();
                        {
                            var url = "http://localhost:93/gsam/api/client/search";

                            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                            webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                            string data = JsonConvert.SerializeObject(sep);
                            var response = webClient.UploadString(url, data);
                            SearchEntityReturn result = JsonConvert.DeserializeObject<SearchEntityReturn>(response);

                            if (result.data == null) result.data = new List<Entity>();
                            return result.data;

                        }
                    }
                    else
                    {
                        return new List<Entity>();
                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }

        public class SearchEntityReturn
        {
            public string status { get; set; }
            public string message { get; set; }
            public List<Entity> data { get; set; }
        }

        public class SearchEntityPost
        {
            public string server { get; set; }
            public string database { get; set; }
            public string user { get; set; }
            public string password { get; set; }
            public string SearchString { get; set; }
            public int Client { get; set; } = 0;
            public int Counterparty { get; set; } = 0;
            public int Agent { get; set; } = 0;
            public int Stockbroker { get; set; } = 0;
            public int Bank { get; set; } = 0;
            public int TransferSecretary { get; set; } = 0;
            public int GratuityEmployer { get; set; } = 0;
            public int PropertyManager { get; set; } = 0;
            public int Evaluator { get; set; } = 0;
            public int Conveyor { get; set; } = 0;
            public int Custodian { get; set; } = 0;
        }
    }
}