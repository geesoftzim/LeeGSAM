using LastTrialGene.Model;
using LastTrialGene.Models;
using LastTrialGene.Models.custom;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Web;


namespace LastTrialGene.AssetPortfolioContext
{


    public class PortModellingACReturn
    {
        public object status { get; set; }
        public object message { get; set; }
        public AssetClasses data { get; set; }
    }

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

    public class AssetClasses
    {
        public int ID { get; set; }
        public string ClientID { get; set; }
        public float MoneyMarket { get; set; }
        public float Bonds { get; set; }
        public float Equities { get; set; }
        public float Property { get; set; }
        public float Cash { get; set; }
        public bool? Global { get; set; }
        //  public bool UseGlobalPortfolioModel { get; set; }
    }

    public class PortModellingACCall
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ClientID { get; set; }
    }

    public class PortModellingCSCall
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ClientID { get; set; }
    }

    public class PortModellingAssetClassesUpdate
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ClientID { get; set; }
        public float MoneyMarket { get; set; }
        public float Bonds { get; set; }
        public float Equities { get; set; }
        public float Property { get; set; }
        public float Cash { get; set; }
        public bool Global { get; set; }
        public bool UseGlobal { get; set; }
        public int Update { get; set; }
        public int Delete { get; set; }

    }

    public class newPost
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
    }

  

  
    public static class AssetPortfolioContext
    {
        public static AssetClasses GetAssetPort()
        {
           // var result = "";

            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {

              //  ClientDetailsMDL pm;
             //   ClientDetailsData clients = new ClientDetailsData();
                PortModellingACReturn pm1 = new PortModellingACReturn();

                var client = new HttpClient();
                {
                    var endpoint = new Uri("http://localhost:93/gsam/api/client/view_portfolio_modelling_asset_classes");
                    //var result = client.GetAsync(endpoint).Result;
                    //var json = result.Content.ReadAsStringAsync().Result;


                    var PortModellingCSCall = new PortModellingCSCall()
                    {
                        ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString())//"43600"//(string)comboBox.Value

                    };

                    var newPostJson = JsonConvert.SerializeObject(PortModellingCSCall);
                    var payload = new StringContent(newPostJson, Encoding.UTF8, "application/json");
                    var result = client.PostAsync(endpoint, payload).Result.Content.ReadAsStringAsync().Result;

                    try
                    {


                        pm1 = JsonConvert.DeserializeObject<PortModellingACReturn>(result);

                        // clients = pm1.data;
                        /////////////////////Try to reconstruct the loop//////////////////////////
                        //  foreach (var result1 in pm.data.BankBranch)
                        // {
                        //    bankbranch.Add(new Bankbranch(result1.BankID, result1.BranchName + "  |  " + result1.BankName, result1.BankName));
                        // }
                        /////////////////Try to reconstruct the loop/////////////////////

                    }
                    catch (Exception ex)
                    {
                        Console.Out.WriteLine("-----------------");
                        Console.Out.WriteLine(ex.Message);
                    }
                }
                // return bankBranch;
                if (pm1.data != null)
                {
                }
                else {
                    pm1.data = new AssetClasses();
                }
               
                return pm1.data;
            }
            else
            {
                return new AssetClasses();
            }
            //  return null;
        }



        
            public static void NewAssetClasses(AssetClasses  asset)
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                PortModellingAssetClassesUpdate portModellingAssetClasses = new PortModellingAssetClassesUpdate();

                {

                    //  portModellingAssetClasses.ID = asset.ID;
                    portModellingAssetClasses.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());// int.Parse(asset.ClientID);
                    portModellingAssetClasses.MoneyMarket = asset.MoneyMarket;//portModellingAssetClasses.MoneyMarket;
                    portModellingAssetClasses.Bonds = asset.Bonds;
                    portModellingAssetClasses.Equities = asset.Equities;
                    portModellingAssetClasses.Property = asset.Property;
                    portModellingAssetClasses.Cash = asset.Cash;
                    portModellingAssetClasses.Global = (bool)asset.Global;
                    portModellingAssetClasses.Update = 0;
                    portModellingAssetClasses.Delete = 0;


                }

                try
                {

                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/client/update_portfolio_modelling_asset_classes";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(portModellingAssetClasses);
                        var response = webClient.UploadString(url, data);
                        var result = JsonConvert.DeserializeObject<Sample.Jresponse>(response);
                        System.Console.WriteLine(result);


                        if (result.data != null)
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data.ClientID;
                            WriteLogPost("ContactsContext.cs UpdateContacts()" + data + " -----Message----" + result.message + "-----data---" + result.data.ClientID);

                        }
                        else
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data;
                            WriteLogPost("ContactsContext.cs UpdateContacts()" + data + " -----Message----" + result.message + "-----data---" + result.data);

                        }

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
        public static void WriteLogPost(string message)
        {
            using (FileStream file = new FileStream(System.Web.HttpContext.Current.Server.MapPath("~/postlogs.txt"), FileMode.Append, FileAccess.Write))
            {
                StreamWriter streamWriter = new StreamWriter(file);
                streamWriter.WriteLine(System.DateTime.Now.ToString() + ":" + message + "\n---\n");
                streamWriter.Close();
            }
        }
        public static void UpdateAssetClasses(AssetClasses asset)
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                PortModellingAssetClassesUpdate portModellingAssetClasses = new PortModellingAssetClassesUpdate();
                {

                    //  portModellingAssetClasses.ID = asset.ID;
                    portModellingAssetClasses.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());//int.Parse(asset.ClientID.ToString());
                    portModellingAssetClasses.MoneyMarket = asset.MoneyMarket;//portModellingAssetClasses.MoneyMarket;
                    portModellingAssetClasses.Bonds = asset.Bonds;
                    portModellingAssetClasses.Equities = asset.Equities;
                    portModellingAssetClasses.Property = asset.Property;
                    portModellingAssetClasses.Cash = asset.Cash;
                    portModellingAssetClasses.Global = (bool)asset.Global;
                    portModellingAssetClasses.Update = 1;
                    portModellingAssetClasses.Delete = 0;


                }

                try
                {

                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/client/update_portfolio_modelling_asset_classes";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(portModellingAssetClasses);
                        var response = webClient.UploadString(url, data);
                        var result = JsonConvert.DeserializeObject<Jresponse>(response);
                        System.Console.WriteLine(result);


                        if (result.data != null)
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data.ClientID;
                            WriteLogPost("ContactsContext.cs UpdateContacts()" + data + " -----Message----" + result.message + "-----data---" + result.data.ClientID);

                        }
                        else
                        {
                            HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data;
                            WriteLogPost("ContactsContext.cs UpdateContacts()" + data + " -----Message----" + result.message + "-----data---" + result.data);

                        }
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