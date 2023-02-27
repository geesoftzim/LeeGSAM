using LastTrialGene.Model;
using LastTrialGene.Models;
using LastTrialGene.Models.custom;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Web;
using static LastTrialGene.Models.ParamsClientForm;
using static LastTrialGene.Models.Sample;

namespace LastTrialGene.ContactsContext
{


    /// <summary>
    /// /////////////////////////////////////////////////////////
    /// 
    public class City
    {
        public int ID { get; set; }
        public int PhysicalCity { get; set; }
        public int PostalCity { get; set; }
        public string Name { get; set; }

        public City(int ID, string Name)
        {
            this.PhysicalCity = ID;
            this.PostalCity = ID;
            this.Name = Name;
        }
    }

    public class Country
    {
        public int ID { get; set; }
        
       public int CountryOfResidence { get; set; }
        public int PhysicalCountry { get; set; }
        public int PostalCountry { get; set; }
        public string Name { get; set; }
        public string imgUrl { get; set; }

        public Country(int ID, string Name)
        {
            this.CountryOfResidence = ID;
            this.PhysicalCountry = ID;
            this.PostalCountry = ID;
            this.Name = Name;
            this.imgUrl = imgUrl;

        }
    }

    public class Data
    {
        public List<SalutationType> SalutationType { get; set; }
        public Identificationtype[] IdentificationType { get; set; }
        public List<Sex> Sex { get; set; }
        public List<Nationality> Nationality { get; set; }
        public List<Country> Country { get; set; }
        public List<City> City { get; set; }
    }

    public class Identificationtype
    {
        public string Type { get; set; }
        public string IdentificationType { get; set; }
        public int Corporate { get; set; }
        
        public string Name { get; set; }

        public Identificationtype(string Type, string Name,int Corporate)
        {
            this.IdentificationType = Type;
            this.Name = Name;
            this.Corporate = Corporate;
        }
    }

    public class Nationality
    {
        public int ID { get; set; }

        public int nationality { get; set; }
        public int Citizenship { get; set; }
        public int Citizenship2 { get; set; }

        public string Name { get; set; }
        public string imgUrl { get; set; }

        public Nationality(int ID, string Name)
        {
            this.nationality = ID;
            this.Citizenship = ID;
            this.Citizenship2 = ID;
            this.Name = Name;
            this.imgUrl = imgUrl;
        }
    }

    public class Root
    {
        public string status { get; set; }
        public string message { get; set; }
        public Data data { get; set; }
    }

    public class SalutationType
    {
        public string Type { get; set; }
        public int Salutationtype { get; set; }

        public string Name { get; set; }
        public SalutationType(string Type, string Name)
        {
            this.Salutationtype = int.Parse(Type);
            this.Name = Name;

        }
    }

    public class Sex
    {
        public int ID { get; set; }
        public int SexID { get; set; }
        public string Name { get; set; }
        public Sex(int ID, string Name)
        {
            this.SexID = ID;
            this.Name = Name;
        }

    }



    ////////////////////////////////////////////////////
    /// </summary>
    public class CustomObject
    {

        public CustomObject()
        {
        }
        /*public CustomObject(string ID)
        {
            this.ID = ID;
        }*/

                public CustomObject(string ClientID,int CounterpartyID, int StockBrokerID, int CustodianID, int TransferSecretaryID)
        {
            this.ClientID = ClientID;
            this.CounterpartyID = CounterpartyID;
            this.StockBrokerID = StockBrokerID;
            this.CustodianID = CustodianID;
            this.TransferSecretaryID = TransferSecretaryID;
        }
		

        /*public CustomObject(string server, string user, string password, string ClientID)
        {
            this.server = server;
            this.user = user;
            this.password = password;
            this.database = database;
            this.ClientID = ClientID;
        }*/
        public string server { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public string database { get; set; }
        public string ClientID { get; set; }
        public string ID { get; set; }

        public int CounterpartyID { get; set; }
        public int StockBrokerID { get; set; }
        public int CustodianID { get; set; }
        public int TransferSecretaryID { get; set; }




    }

    public class ContactsMDL
    {
        public string server { get; set; } = "OPTIMUSPRIME";
        public string user { get; set; } = "debugger";
        public string password { get; set; } = "bug";
        public string database { get; set; } = "GSAMUP";

        public int ClientID { get; set; }
        
                 public int MandateType { get; set; }

        public int ContactType { get; set; }
        public int CoOwner { get; set; }
        
        public string Name { get; set; }
        public string PhysicalAddress { get; set; }
        public string PhysicalAddress2 { get; set; }
        public string PhysicalAddress3 { get; set; }
        public int PhysicalCity { get; set; }
        public int PhysicalCountry { get; set; }
        public string PostalAddress { get; set; }
        public string PostalAddress2 { get; set; }
        public string PostalAddress3 { get; set; }
        public int PostalCity { get; set; }
        public int PostalCountry { get; set; }
        public string PhoneNo { get; set; }
        public string PhoneNo2 { get; set; }
        public string EmailAddress { get; set; }
        public int IdentificationType { get; set; }
        public string IdentificationNo { get; set; }
        public int ContactID { get; set; }
        public bool Update { get; set; }
        public bool Delete { get; set; }
        public int Nationality { get; set; }
        public int CountryOfResidence { get; set; }
        public bool IsUSResident { get; set; }
        public bool HasUSGreenCard { get; set; }
        public string OwnershipPercent { get; set; }
        public int Citizenship { get; set; }
        public System.Int32? Citizenship2 { get; set; }
    }

    public class ContactListPost
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ClientID { get; set; }
        public int? CounterpartyID { get; set; } = 0;
        public int? StockBrokerID { get; set; } = 0;
        public int? CustodianID { get; set; } = 0;
        public int? TransferSecretaryID { get; set; } = 0;
    }

    public class ContactListReturn
    {
        public string status { get; set; }
        public string message { get; set; }
        public List<ContactList> data { get; set; }
    }

    public class CreationDate
    {
        public string date { get; set; }
        public int? timezone_type { get; set; }
        public string timezone { get; set; }
    }

    public class ContactList
    {
        public string ID { get; set; }
        public int? ClientID { get; set; }
        public int? CounterpartyID { get; set; }
        public int? MMCounterpartyID { get; set; }
        public int? ContactType { get; set; }
        public int? SalutationType { get; set; }
        public string Name { get; set; }
        /// <summary>
        /// //////////////////////////////////////////////////
        /// </summary>
        /// 
        public string Photo { get; set; }
        public string SignaturePhoto { get; set; }
        public string MandateType { get; set; }
        public int RelationShip { get; set; }
        public string GovReg { get; set; }
        public string CoOwner { get; set; }
        public int ContactOnly { get; set; }

        public int DualCit { get; set; }
        //public int MandateType { get; set; }

        public string EmailAddress2 { get; set; }
        public string EmailAddress3 { get; set; }
        public string EmailAddress4 { get; set; }

        /// <summary>
        /// //////////////////////////////////////////////////
        /// </summary>
        /// 


        public string PhysicalAddress { get; set; }
        public string PhysicalAddress2 { get; set; }
        public int? PhysicalCity { get; set; }
        public int? PhysicalCountry { get; set; }
        public string PostalAddress { get; set; }
        public string PostalAddress2 { get; set; }
        public int? PostalCity { get; set; }
        public int? PostalCountry { get; set; }
        public string PhoneNo { get; set; }
        public string PhoneNo2 { get; set; }
        public object PhoneNo3 { get; set; }
        public string EmailAddress { get; set; }
        public object FileName { get; set; }
        public string PostalAddress3 { get; set; }
        public string PhysicalAddress3 { get; set; }
        public string Username { get; set; }
        //public CreationDate CreationDate { get; set; }

        public DateTime CreationDate { get; set; }
        public int? StockBrokerID { get; set; }
        public int? CustodianID { get; set; }
        public int? TransferSecretaryID { get; set; }
        public int? IdentificationType { get; set; }


        public int? SexID { get; set; }
        public string IdentificationNo { get; set; }
        public int? Nationality { get; set; }
        public int? IsUSResident { get; set; }
        public int? HasUSGreenCard { get; set; }
        public string OwnershipPercent { get; set; }
        public int? Citizenship { get; set; }
        public System.Int32? Citizenship2 { get; set; }
        public int? CountryOfResidence { get; set; }
        public string ContactTypeName { get; set; }
        public string IdentificationTypeName { get; set; }
        public string PostalCityName { get; set; }
        public string PostalCountryName { get; set; }
        public string PhysicalCityName { get; set; }
        public string PhysicalCountryName { get; set; }
        public string NationalityName { get; set; }
        public string CitizenshipName { get; set; }
        public object Citizenship2Name { get; set; }
        public int? Update { get; set; }
        public int? Delete { get; set; }




    }
    public static class ContactsContext
    {
        public static List<ContactList> GetContacts()
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null)
            {
                // var result = "";
                List<ContactList> m = new List<ContactList>();

                // if (HttpContext.Current.Session["SelectedClientID"] != null)
                //  {

                ContactList pm;
                ContactList clients = new ContactList();
                List<ContactList> clientslist = new List<ContactList> ();
                ContactListReturn pm1 = new ContactListReturn();

                var client = new HttpClient();
                {
                    var endpoint = new Uri("http://localhost:93/gsam/api/client/contact_list");
                    //var result = client.GetAsync(endpoint).Result;
                    //var json = result.Content.ReadAsStringAsync().Result;


                    var CustomObject = new CustomObject()
                    {
                    ClientID = HttpContext.Current.Session["SelectedClientID"].ToString(),
                    CounterpartyID = 0,
                    StockBrokerID = 0,
                    CustodianID = 0,
                    TransferSecretaryID = 0,
                    //ID = HttpContext.Current.Session["SelectedClientID"].ToString()//"43600"//(string)comboBox.Value

                    };

                    var newPostJson = JsonConvert.SerializeObject(CustomObject);
                    var payload = new StringContent(newPostJson, Encoding.UTF8, "application/json");
                    var result = client.PostAsync(endpoint, payload).Result.Content.ReadAsStringAsync().Result;

                    try
                    {


                        pm1 = JsonConvert.DeserializeObject<ContactListReturn>(result);
                      

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
                    /* HttpContext.Current.Session["CustodialGroup"] = pm1.data.CustodialGroup;
                     HttpContext.Current.Session["ClientRisk"] = pm1.data.ClientRisk;
                     HttpContext.Current.Session["Sector"] = pm1.data.Sector;
                     HttpContext.Current.Session["ClientGroup"] = pm1.data.ClientGroup;
                     HttpContext.Current.Session["SourceOfIncome"] = pm1.data.IncomeType;
                     HttpContext.Current.Session["Branch"] = pm1.data.IncomeType;
                     HttpContext.Current.Session["Salutationtype"] = pm1.data.SalutationType;
                     HttpContext.Current.Session["Sex"] = pm1.data.SexType;
                     HttpContext.Current.Session["Nationality"] = pm1.data.Nationality;*/
                    clientslist = pm1.data;
                }
                else {
                    pm= new ContactList();
                }
                return clientslist;
            }
            else {

                return new List<ContactList>();

            }


            
            // }
            ///  else
            //  {
            //     return m;
            //}
            //  return null;
        }

        public static Root getParams()
        {

            Root cp;
            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/contact_params");
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



                cp = new Root();
                cp = JsonConvert.DeserializeObject<Root>(result);




            }
            return cp;
        }
        //HttpContext.Current.Session["CustodialGroup"]="";







        public static List<Country> GetCountry()
        {
            List<Country> c = getParams().data.Country;

            if (HttpContext.Current.Session["Country"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Country"].ToString());

                /*  foreach (var elem in c)
                  {
                      var id = elem.SexType;
                      var name = elem.SexName;

                      if (elem.ID == v)
                      {
                          c[0] = new Sex(id, name);
                      }
                  }*/
            }
            return c;
        }

        public static List<City> GetCity()
        {
            List<City> c = getParams().data.City;

            if (HttpContext.Current.Session["City"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["City"].ToString());

                /*  foreach (var elem in c)
                  {
                      var id = elem.SexType;
                      var name = elem.SexName;

                      if (elem.ID == v)
                      {
                          c[0] = new Sex(id, name);
                      }
                  }*/
            }
            return c;
        }
        public static List<Sex> GetSex1()
        {
            List<Sex> c = getParams().data.Sex;

            if (HttpContext.Current.Session["Sex"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Sex"].ToString());

                /*  foreach (var elem in c)
                  {
                      var id = elem.SexType;
                      var name = elem.SexName;

                      if (elem.ID == v)
                      {
                          c[0] = new Sex(id, name);
                      }
                  }*/
            }
            return c;
        }

        /*public static List<IdentificationType> GetIdentification()
        {
            List<IdentificationType> c = getParams().data.IdentificationType;

            if (HttpContext.Current.Session["Identificationtype"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Identificationtype"].ToString());


            }
            return c;
        }*/

        public static Identificationtype[] GetIdentification()
        {
            int v = 0;
            Identificationtype[] c = new Identificationtype[] { };
            if (HttpContext.Current.Session["SelectedCounterType"] != null)
            {
                v = int.Parse(HttpContext.Current.Session["SelectedCounterType"].ToString());
             c = Array.FindAll(getParams().data.IdentificationType, ct => ct.Corporate == v).ToArray();
            }
            else {
                c = new Identificationtype[] { };


            }

            return c;
        }





        #region GetTitle
        public static List<SalutationType> GetTitle()
        {
            List<SalutationType> c = getParams().data.SalutationType;

            if (HttpContext.Current.Session["Salutationtype"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Salutationtype"].ToString());

                /*foreach (var elem in c)
                {
                    var Type = elem.Type;
                    var Name = elem.Name;

                    if (Type.Equals(v.ToString()))
                    {
                        c[0] = new Salutationtype(Type, Name);
                    }
                }*/
            }
            return c;
        }



        public static List<Nationality> GetNationality()
        {
            List<Nationality> c = getParams().data.Nationality;

            if (HttpContext.Current.Session["Nationality"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Nationality"].ToString());

                /*   foreach (var elem in c)
                   {
                       var id = elem.ID;
                       var Name = elem.Name;

                       if (id == v)
                       {
                           c[0] = new Nationality(id, Name);
                       }
                   }*/
            }
            return c;
        }


        #endregion



        public static void NewContacts(ContactList emp)
        {

            ContactsMDL contactsMDL = new ContactsMDL();
            {
                contactsMDL.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());
                contactsMDL.ContactType = 0;// int.Parse(emp.ContactType.ToString());
                contactsMDL.Name = emp.Name;
                contactsMDL.PhysicalAddress = emp.PhysicalAddress;
                contactsMDL.PhysicalAddress2 = emp.PhysicalAddress2;
                contactsMDL.PhysicalAddress3 = emp.PhysicalAddress3;
                contactsMDL.PhysicalCity = int.Parse(emp.PhysicalCity.ToString());
                contactsMDL.PhysicalCountry = int.Parse(emp.PhysicalCountry.ToString());
                contactsMDL.PostalAddress = emp.PostalAddress;
                contactsMDL.PostalAddress2 = emp.PostalAddress2;
                contactsMDL.PostalCity = int.Parse(emp.PostalCity.ToString());
                contactsMDL.PostalCountry = int.Parse(emp.PostalCountry.ToString());
                contactsMDL.PhoneNo = emp.PhoneNo;
                contactsMDL.PhoneNo2 = emp.PhoneNo2;
                contactsMDL.EmailAddress = emp.EmailAddress;
                contactsMDL.IdentificationType = int.Parse(emp.IdentificationType.ToString());
                contactsMDL.IdentificationNo = emp.IdentificationNo;
                contactsMDL.ContactID = 0;//int.Parse(emp.ID.ToString());
                contactsMDL.Update = false;
                contactsMDL.Delete = false;
                contactsMDL.Nationality = int.Parse(emp.Nationality.ToString());
                contactsMDL.CountryOfResidence = 0;//int.Parse(emp.CountryOfResidence.ToString());
                contactsMDL.IsUSResident = emp.IsUSResident == 1 ? true : false;
                contactsMDL.HasUSGreenCard = emp.HasUSGreenCard == 1 ? true : false;
                contactsMDL.CoOwner = int.Parse(emp.CoOwner);
                contactsMDL.OwnershipPercent = emp.OwnershipPercent;
                contactsMDL.MandateType = int.Parse(emp.MandateType);
                //  contactsMDL.Citizenship = int.Parse(emp.Citizenship2.ToString());
                contactsMDL.Citizenship2 = emp.Citizenship2;
            }
           
        

            try
            {

                var webClient = new WebClient();
                {
                    //webClient.BaseAddress = "http:localhost:93/gsam";
                    var url = "http://localhost:93/gsam/api/client/create_update_contact";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(contactsMDL);
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
        public static void WriteLogPost(string message)
        {
            using (FileStream file = new FileStream(System.Web.HttpContext.Current.Server.MapPath("~/postlogs.txt"), FileMode.Append, FileAccess.Write))
            {
                StreamWriter streamWriter = new StreamWriter(file);
                streamWriter.WriteLine(System.DateTime.Now.ToString() + ":" + message + "\n---\n");
                streamWriter.Close();
            }
        }
        public static void UpdateContacts(ContactList emp)
        {

            ContactsMDL contactsMDL = new ContactsMDL();
            {
                contactsMDL.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());
                contactsMDL.ContactType = 0;// int.Parse(emp.ContactType.ToString());
                contactsMDL.Name = emp.Name;
                contactsMDL.PhysicalAddress = emp.PhysicalAddress;
                contactsMDL.PhysicalAddress2 = emp.PhysicalAddress2;
                contactsMDL.PhysicalAddress3 = emp.PhysicalAddress3;
                contactsMDL.PhysicalCity = int.Parse(emp.PhysicalCity.ToString());
                contactsMDL.PhysicalCountry = int.Parse(emp.PhysicalCountry.ToString());
                contactsMDL.PostalAddress = emp.PostalAddress;
                contactsMDL.PostalAddress2 = emp.PostalAddress2;
                contactsMDL.PostalCity = int.Parse(emp.PostalCity.ToString());
                contactsMDL.PostalCountry = int.Parse(emp.PostalCountry.ToString());
                contactsMDL.PhoneNo = emp.PhoneNo;
                contactsMDL.PhoneNo2 = emp.PhoneNo2;
                contactsMDL.EmailAddress = emp.EmailAddress;
                contactsMDL.IdentificationType = int.Parse(emp.IdentificationType.ToString());
                contactsMDL.IdentificationNo = emp.IdentificationNo;
                contactsMDL.ContactID = int.Parse(emp.ID.ToString());
                contactsMDL.Update = true;
                contactsMDL.Delete = false;
                contactsMDL.Nationality = int.Parse(emp.Nationality.ToString());
                contactsMDL.CountryOfResidence = 0;// int.Parse(emp.CountryOfResidence.ToString());
                contactsMDL.IsUSResident = emp.IsUSResident == 1 ? true : false;
                contactsMDL.HasUSGreenCard =  emp.HasUSGreenCard==1?true:false;
                contactsMDL.OwnershipPercent = emp.OwnershipPercent;
                //contactsMDL.Citizenship = int.Parse(emp.Citizenship.ToString());
                contactsMDL.Citizenship2 = int.Parse(emp.Citizenship2.ToString());
            }
            emp.ClientID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());
            emp.Update = 1;
            emp.Delete = 0;

            try
            {

                var webClient = new WebClient();
                {
                    //webClient.BaseAddress = "http:localhost:93/gsam";
                    var url = "http://localhost:93/gsam/api/client/create_update_contact";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(contactsMDL);
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