using LastTrialGene.Model;
using LastTrialGene.Models;
using LastTrialGene.Models.custom;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Web;
using static LastTrialGene.CounterSectorsContext.CounterSector;
using static LastTrialGene.Models.ParamsClientBankDetails;

namespace LastTrialGene.CounterSectorsContext
{



    

  



    public class PortModellingCSCall
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ClientID { get; set; }
    }

  

    public class newPost
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
    }

    public class PortModellingCSReturn
    {
        public object status { get; set; }
        public object message { get; set; }
        public List<CounterSector> data { get; set; }
    }

    public class PortModellingCounterSectorsUpdate
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ClientID { get; set; }
        public int CounterIndustryType { get; set; }
        public float Percentage { get; set; }
        public bool Global { get; set; }
        public int ID { get; set; }
        public bool Update { get; set; }
        public bool Delete { get; set; }

    }
    public class CounterSector
    {
        public static int GlobalClientID { get; set; }
        public int ID { get; set; }
        public int ClientID { get; set; }
        public int CounterIndustryType { get; set; }
        public string Percentage { get; set; }
        public int Global { get; set; }

        public string CounterIndustryTypeName { get; set; }

        //public List<CounterSector> Fill()
        //{
        //    try
        //    {
        //        PortModellingACCall accall = new PortModellingACCall();
        //        accall.server = ".\\SQLEXPRESS";
        //        accall.database = "GSAM_WEB";
        //        accall.user = "sa";
        //        accall.password = "Leroy1994";
        //        accall.ClientID = GlobalClientID;

        //        var webClient = new WebClient();
        //        {
        //            var url = "http:localhost:93/gsam/api/client/view_portfolio_modelling_counter_sectors";

        //            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
        //            webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        //            string data = JsonConvert.SerializeObject(accall);
        //            var response = webClient.UploadString(url, data);
        //            PortModellingCSReturn result = JsonConvert.DeserializeObject<PortModellingCSReturn>(response);
        //            return result.data;

        //        }
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}



        //public void Update(
        //     int ID, int ClientID, int CounterIndustryType, float Percentage)
        //{

        //    try
        //    {
        //        PortModellingCounterSectorsUpdate csu = new PortModellingCounterSectorsUpdate();
        //        csu.server = ".\\SQLEXPRESS";
        //        csu.database = "GSAM_WEB";
        //        csu.user = "sa";
        //        csu.password = "Leroy1994";
        //        csu.ClientID = ClientID;
        //        csu.CounterIndustryType = CounterIndustryType;
        //        csu.Percentage = Percentage;
        //        csu.Global = false;
        //        csu.ID = ID;
        //        csu.Update = true;
        //        csu.Delete = false;

        //        var webClient = new WebClient();
        //        {
        //            var url = "http:localhost:93/gsam/api/client/update_portfolio_modelling_counter_sector";

        //            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
        //            webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        //            string data = JsonConvert.SerializeObject(csu);
        //            var response = webClient.UploadString(url, data);
        //            //PortModellingCSReturn result = JsonConvert.DeserializeObject<PortModellingCSReturn>(response);
        //            //return result.data;

        //        }
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}


    }

    public class CounterIndustryType
    {
        public int Type { get; set; }

        public int counterIndustryType { get; set; }
        public string CounterIndustryTypeName { get; set; }
        public string Name { get; set; }

        public CounterIndustryType(int Type, string Name)
        {
            this.counterIndustryType = Type;
            this.CounterIndustryTypeName = Name;
        }

    }
    public class CounterIndustryTypeList
        {
            public int Type { get; set; }
            
                 public int CounterIndustryType { get; set; }
            public string CounterIndustryTypeName { get; set; }
            public string Name { get; set; }

            public CounterIndustryTypeList(int Type, string Name) {
                this.CounterIndustryType = Type;
                this.CounterIndustryTypeName= Name;
            }

        }

        public class PortModellingParams
        {
            public List<CounterIndustryTypeList> CounterIndustryType { get; set; }
        }

        public class PortModellingParamsReturn
        {
            public string status { get; set; }
            public string message { get; set; }
            public PortModellingParams data { get; set; }
        }
  





 


  

  
    public static class CounterSectorsContext  
    {
        public static List<CounterSector> GetCountersSector()
        {
            // var result = "";
            List <CounterSector> counterSectors=  new List<CounterSector>();

            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {

                try
                {
                    PortModellingCSCall accall = new PortModellingCSCall();
                    accall.server = ".\\SQLEXPRESS";
                    accall.database = "GSAM_WEB";
                    accall.user = "sa";
                    accall.password = "Leroy1994";
                    accall.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());

                    var webClient = new WebClient();
                    {
                        var url = "http://localhost:93/gsam/api/client/view_portfolio_modelling_counter_sectors";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(accall);
                        var response = webClient.UploadString(url, data);
                        PortModellingCSReturn result = JsonConvert.DeserializeObject<PortModellingCSReturn>(response);
                        counterSectors = result.data;
                         

                    }
                }catch(Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
                return counterSectors;
                }
            else {
                return counterSectors;
            }
          
    
        }


        public static List<CounterIndustryTypeList> GetCounterIndustryType()
        {
            PortModellingParamsReturn pm;
            PortModellingParams portModellingParams = new PortModellingParams();

            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/portfolio_modelling_params");
                //var result = client.GetAsync(endpoint).Result;
                //var json = result.Content.ReadAsStringAsync().Result;

                var newPost = new Post()
                {
                    server = ".\\SQLEXPRESS",
                    user = "sa",
                    password = "Leroy1994",
                    database = "GSAM_WEB"

                };

                var newPostJson = JsonConvert.SerializeObject(newPost);
                var payload = new StringContent(newPostJson, Encoding.UTF8, "application/json");
                var result = client.PostAsync(endpoint, payload).Result.Content.ReadAsStringAsync().Result;

                try
                {

                    pm = new PortModellingParamsReturn();
                    pm = JsonConvert.DeserializeObject<PortModellingParamsReturn>(result);
                    portModellingParams = pm.data;
                 
                   // CounterIndustryType x =   new CounterIndustryType(portModellingParams.Type, portModellingParams.Name);
                    //bank_array = pm.data.Banks;
                    /**  foreach (var result1 in pm.data.)
                      {
                       banks.Add(new Bank(result1., result1.Name));
                     }*/

                }
                catch (Exception ex)
                {
                    Console.Out.WriteLine("-----------------");
                    Console.Out.WriteLine(ex.Message);
                }
            }
            // GetBranch();
            return portModellingParams.CounterIndustryType; 
        }




        public static void NewCounterSectors(CounterSector counterSectors1)
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                PortModellingCounterSectorsUpdate portModellingCounterSectorsUpdate = new PortModellingCounterSectorsUpdate();
                {

                    portModellingCounterSectorsUpdate.ID = counterSectors1.ID;
                    portModellingCounterSectorsUpdate.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());//int.Parse(asset.ClientID.ToString());
                    portModellingCounterSectorsUpdate.CounterIndustryType = counterSectors1.CounterIndustryType;
                    portModellingCounterSectorsUpdate.Percentage = float.Parse(counterSectors1.Percentage);
                    portModellingCounterSectorsUpdate.Global = counterSectors1.Global == 1 ? true : false;
                    portModellingCounterSectorsUpdate.Update = false;
                    portModellingCounterSectorsUpdate.Delete = false;


                }

                try
                {

                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/client/update_portfolio_modelling_counter_sector";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(portModellingCounterSectorsUpdate);
                        var response = webClient.UploadString(url, data);
                        var result = JsonConvert.DeserializeObject<Sample.Jresponse>(response);
                        System.Console.WriteLine(result);

                        //Session["SelectedClientID"] = result.data.ClientID;
                        //    Response.Redirect("aaac.aspx");

                        //  String cv = HttpContext.Current.Request.RawUrl;
                        // String message = "new Individual Account Successfully Saved";
                        //  Response.Redirect("webForm2.aspx?param1=" + EncryptionHelper.Encrypt(message) + "&param2=" + EncryptionHelper.Encrypt(cv));
                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }

            }
            else {

                HttpContext.Current.Session["message"] = "Please Select Client On The Search";


            }
               
        }
        public static void UpdateCounterSectors(CounterSector counterSectors1)
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                PortModellingCounterSectorsUpdate portModellingCounterSectorsUpdate = new PortModellingCounterSectorsUpdate();
                {

                    portModellingCounterSectorsUpdate.ID = counterSectors1.ID;
                    portModellingCounterSectorsUpdate.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());//int.Parse(asset.ClientID.ToString());
                    portModellingCounterSectorsUpdate.CounterIndustryType = counterSectors1.CounterIndustryType;
                    portModellingCounterSectorsUpdate.Percentage = float.Parse(counterSectors1.Percentage);
                    portModellingCounterSectorsUpdate.Global = counterSectors1.Global==1?true:false;
                    portModellingCounterSectorsUpdate.Update = true;
                    portModellingCounterSectorsUpdate.Delete = false;


                }

                try
                {

                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/client/update_portfolio_modelling_counter_sector";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(portModellingCounterSectorsUpdate);
                        var response = webClient.UploadString(url, data);
                        var result = JsonConvert.DeserializeObject<Sample.Jresponse>(response);
                        System.Console.WriteLine(result);

                        //Session["SelectedClientID"] = result.data.ClientID;
                        //    Response.Redirect("aaac.aspx");

                        //  String cv = HttpContext.Current.Request.RawUrl;
                        // String message = "new Individual Account Successfully Saved";
                        //  Response.Redirect("webForm2.aspx?param1=" + EncryptionHelper.Encrypt(message) + "&param2=" + EncryptionHelper.Encrypt(cv));
                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }


        }

    }

}
