using Azure;
using LastTrialGene.Model;
using LastTrialGene.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using static DevExpress.Xpo.Helpers.AssociatedCollectionCriteriaHelper;
using static LastTrialGene.Models.ParamsClientBankDetails;
using static LastTrialGene.Models.ParamsClientForm;

//using static LastTrialGene.Models.ParamsClientBankDetails;

namespace LastTrialGene.Code
{
    public class BanksContext
    {
    }



    public static class BanksDataProvider
    {


        //public static List<BankDetailsData> Fill(int clientID)
        public static List<BankDetailsData2> GetCounterBank()
        {
            string clientID = "";
            List<BankDetailsData2>  l = new List<BankDetailsData2>();

            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                clientID = HttpContext.Current.Session["SelectedClientID"].ToString();




                var CustomObject = new CustomObject()
                {
                    ClientID = HttpContext.Current.Session["SelectedClientID"].ToString()//"43600"//(string)comboBox.Value

                };
                try
                {
                    //client trading accounts not bank details

                    BankDetailsListPost bankDetailsListPost = new BankDetailsListPost();
                    bankDetailsListPost.server = "OPTIMUSPRIME";
                    bankDetailsListPost.database = "GSAMUP";
                    bankDetailsListPost.user = "debugger";
                    bankDetailsListPost.password = "bug";
                    bankDetailsListPost.ClientID = int.Parse(clientID);

                    var webClient = new WebClient();
                    {
                        var url = "http://localhost:93/gsam/api/client/bank_details_list";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(bankDetailsListPost);
                        var response = webClient.UploadString(url, data);
                        BankDetailsDataReturn2 result = JsonConvert.DeserializeObject<BankDetailsDataReturn2>(response);
                        l = result.data;

                    
                  




                    }
                    if (l != null)
                    {
                        //l.Clear();
                       // return l;
                    }
                    else
                    {
                        l = new List<BankDetailsData2>();
                    }
                    return l;
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else{
                return l;
            }
       
        }
        static BankAccountType[] bankAccountTypes_array;
        static Bank[] bank_array;
        static Bankbranch[] bankBranch;
        static Bankbranch[] RebankBranch;
        public static BankAccountType[] GetBankAccountType()
        {
            BankDetailsParams pm;
           // =[2];
            List<BankAccountType> bankAccountTypes = new List<BankAccountType>();

            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/bank_details_params");
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



                    //pm = new BankDetailsParams();
                    var result1 = JsonConvert.DeserializeObject<BankDetailsParams>(result);
                    //  bankAccountTypes = result1.data.BankAccountType;
                    bankAccountTypes_array = result1.data.BankAccountType;


                    //foreach (var result2 in result1.data.BankAccountType)
                    //{
                    //    bankAccountTypes.Add(new BankAccountType(result2.Type, result2.Name));
                    //}

                }
                catch (Exception ex)
                {
                    Console.Out.WriteLine("-----------------");
                    Console.Out.WriteLine(ex.Message);
                }
            }
            return bankAccountTypes_array;
        }


        public static Bank[] GetBanks()
        {
            BankDetailsParams pm;
            List<Bank> banks = new List<Bank>();

            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/bank_details_params");
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

                    pm = new BankDetailsParams();
                    pm = JsonConvert.DeserializeObject<BankDetailsParams>(result);

                    bank_array = pm.data.Banks;
                 //   foreach (var result1 in pm.data.Banks)
                 //    {
                 //     banks.Add(new Bank(result1.ID, result1.Name));
                 //  }

                }
                catch (Exception ex)
                {
                    Console.Out.WriteLine("-----------------");
                    Console.Out.WriteLine(ex.Message);
                }
            }
           // GetBranch();
            return bank_array;
        }


        //public static Bankbranch[] GetBranch()
            public static List<Bankbranch> GetBranch()
        {
            BankDetailsParams pm;
            List<Bankbranch> bankbranch = new List<Bankbranch>();

            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/bank_details_params");
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

                    pm = new BankDetailsParams();
                    pm = JsonConvert.DeserializeObject<BankDetailsParams>(result);

                    bankBranch = pm.data.BankBranch;
                    /////////////////////Try to reconstruct the loop//////////////////////////
                    foreach (var result1 in pm.data.BankBranch)
                        {
                        bankbranch.Add(new Bankbranch(result1.BankID, result1.BranchName + "  |  " + result1.BankName, result1.BankName));
                      }
                    /////////////////Try to reconstruct the loop/////////////////////

                }
                catch (Exception ex)
                {
                    Console.Out.WriteLine("-----------------");
                    Console.Out.WriteLine(ex.Message);
                }
            }
            // return bankBranch;
            return bankbranch;
        }

        private static readonly object lockObject = new object();

        public static void WriteLogPost(string message)
        {
            using (FileStream file = new FileStream(System.Web.HttpContext.Current.Server.MapPath("~/postlogs.txt"), FileMode.Append, FileAccess.Write))
            {
                StreamWriter streamWriter = new StreamWriter(file);
                streamWriter.WriteLine(System.DateTime.Now.ToString() + ":" + message + "\n---\n");
                streamWriter.Close();
            }
        }

        public static void AddNewCounterBank(BankDetailsData2 emp)
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                //lock (lockObject)
                // {
                //List<Issue> issues = GetIssues();
                List<EmploymentDetails> empList = new List<EmploymentDetails>();
                EmploymentDetails b = new EmploymentDetails();

                b.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());//77777;


                BankDetailsMDL createBankDetails = new BankDetailsMDL();
                {

                    // createBankDetails.ClientID = clientID;
                    createBankDetails.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());
                    createBankDetails.AccountName = emp.AccountName;
                    createBankDetails.AccountNo = emp.AccountNo;
                    createBankDetails.AccountType = emp.AccountType;
                    createBankDetails.BankID = emp.BankID;
                    createBankDetails.BankDetailsID = emp.ID;

                    //createBankDetails.AccountType = (int)cbAccountType.Value;
                    createBankDetails.Update = false;
                    createBankDetails.Delete = false;
                }

                try
                {
                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/client/create_update_bank_details";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(createBankDetails);
                        var response = webClient.UploadString(url, data);
                        //var result = JsonConvert.DeserializeObject<BankDetailsMDL>(response);
                        //  var result = JsonConvert.DeserializeObject<ClientParams>(response);
                        var result = JsonConvert.DeserializeObject<CustomBankDetailsDataReturn>(response);
                        System.Console.WriteLine(result);


                        if (result.data != null)
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data.BankDetailsID;
                            WriteLogPost("BanksContext.cs AddNewCounterBank()" + data + " -----Message----" + result.message + "-----data---" + result.data);

                        }
                        else
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data;
                            WriteLogPost("BanksContext.cs AddNewCounterBank()" + data + " -----Message----" + result.message + "-----data---" + result.data);

                        }



                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        public class CustomBankDetailsDataReturn
        {
            public string status { get; set; }
            public string message { get; set; }
            public Data1 data { get; set; }
        }

        public class Data1 {
            public string BankDetailsID { get; set; }
        }

    public static void UpdateCounterBank(BankDetailsData2 emp, int ID)
        {
          // lock (lockObject) { 
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                int cliID= int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());


                BankDetailsMDL createBankDetails = new BankDetailsMDL();
                    
                {

                    // createBankDetails.ClientID = clientID;
                    createBankDetails.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());
                    createBankDetails.AccountName = emp.AccountName;
                    createBankDetails.AccountNo = emp.AccountNo;
                    createBankDetails.AccountType = emp.AccountType;
                    createBankDetails.BankID = emp.BankID;
                    createBankDetails.BankDetailsID = emp.ID;
                    createBankDetails.Update = true;
                    createBankDetails.Delete = false;
                }

                try
                {
                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/client/create_update_bank_details";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(createBankDetails);
                        var response = webClient.UploadString(url, data);
                        var result = JsonConvert.DeserializeObject<CustomBankDetailsDataReturn>(response);
                        
                        System.Console.WriteLine(result);

                        if (result.data != null)
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated RecordID=" + result.data.BankDetailsID;
                            WriteLogPost("BanksContext.cs UpdateCounterBank()" + data + " -----Message----" + result.message + "-----data---" + result.data);

                        }
                        else
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated RecordID=" + result.data;
                            WriteLogPost("BanksContext.cs UpdateCounterBank()" + data + " -----Message----" + result.message + "-----data---" + result.data);

                        }



                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
      //  }
        }

    }

}