using Azure;
using DevExpress.Web.Internal.XmlProcessor;
using LastTrialGene.ContactsContext;
using LastTrialGene.Model;
using LastTrialGene.Models;
using LastTrialGene.Models.custom;
using Newtonsoft.Json;
using System;
using System.Collections;
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
using static DevExpress.Xpo.Helpers.AssociatedCollectionCriteriaHelper;
using static LastTrialGene.Models.ClientDetailsMDL;
using static LastTrialGene.Models.ParamsClientBankDetails;
using static LastTrialGene.Models.ParamsClientForm;
using static LastTrialGene.Models.Sample;

namespace LastTrialGene.Code
{

    [Serializable]
    class InvalidStudentNameException : Exception
    {
        public InvalidStudentNameException() { }

        public InvalidStudentNameException(string name)
                 : base(name)
        //  : base(String.Format("Invalid Student Name: {0}", name))
        {

        }
    }
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

    //public class City
    //{
    //    public int ID { get; set; }
    //    public int PhysicalCity { get; set; }
    //    public int PostalCity { get; set; }
    //    public string Name { get; set; }

    //    public City(int ID, string Name)
    //    {
    //        this.PhysicalCity = ID;
    //        this.PostalCity = ID;
    //        this.Name = Name;
    //    }
    //}

    //public class Country
    //{
    //    public int ID { get; set; }
    //    public int PhysicalCountry { get; set; }
    //    public int PostalCountry { get; set; }
    //    public string Name { get; set; }

    //    public Country(int ID, string Name)
    //    {
    //        this.PhysicalCountry = ID;
    //        this.PostalCountry = ID;
    //        this.Name = Name;

    //    }
    //}
    public static class ClientsContext
    {
        public static ClientDetailsData GetClients()
        {
            // var result = "";
            int SelectedCounterType = 0;
            if (HttpContext.Current.Session["SelectedCounterType"] != null)
            {
                SelectedCounterType = int.Parse(HttpContext.Current.Session["SelectedCounterType"].ToString());
            }


            if (HttpContext.Current.Session["SelectedClientID"] != null & SelectedCounterType==0)
            {

                ClientDetailsMDL pm;
                ClientDetailsData clients = new ClientDetailsData();
                CustomResponse pm1 = new CustomResponse();

                var client = new HttpClient();
                {
                    var endpoint = new Uri("http://localhost:93/gsam/api/client/view");
                    //var result = client.GetAsync(endpoint).Result;
                    //var json = result.Content.ReadAsStringAsync().Result;


                    var CustomObject = new CustomObject()
                    {
                        ID = HttpContext.Current.Session["SelectedClientID"].ToString()//"43600"//(string)comboBox.Value

                    };

                    var newPostJson = JsonConvert.SerializeObject(CustomObject);
                    var payload = new StringContent(newPostJson, Encoding.UTF8, "application/json");
                    var result = client.PostAsync(endpoint, payload).Result.Content.ReadAsStringAsync().Result;

                    try
                    {


                        pm1 = JsonConvert.DeserializeObject<CustomResponse>(result);

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
                if (pm1.data != null) {
                    HttpContext.Current.Session["CustodialGroup"] = pm1.data.CustodialGroup;
                    HttpContext.Current.Session["ClientRisk"] = pm1.data.ClientRisk;
                    HttpContext.Current.Session["Sector"] = pm1.data.Sector;
                    HttpContext.Current.Session["ClientGroup"] = pm1.data.ClientGroup;
                    HttpContext.Current.Session["SourceOfIncome"] = pm1.data.IncomeType;
                    HttpContext.Current.Session["Branch"] = pm1.data.IncomeType;
                    HttpContext.Current.Session["Salutationtype"] = pm1.data.SalutationType;
                    HttpContext.Current.Session["Sex"] = pm1.data.SexType;
                    HttpContext.Current.Session["Nationality"] = pm1.data.Nationality;
                    HttpContext.Current.Session["date"] = pm1.data.DateOfBirth.date;
                    HttpContext.Current.Session["InceptionDate"] = pm1.data.InceptionDate.date;
                }
                //    Response.Redirect("aaac.aspx");
                return pm1.data;
            }
            else
            {
              /**  try
                {
                   
                   
                }
                catch (InvalidStudentNameException e) { 
                
                }*/
                return new ClientDetailsData();
                //throw new InvalidStudentNameException(HttpContext.Current.Session["UpdateMessage"].ToString());
            }
            //  return null;
        }

        public static ClientParams getParams() {

            ClientParams cp;
            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/params");
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



                cp = new ClientParams();
                cp = JsonConvert.DeserializeObject<ClientParams>(result);




            }
            return cp;
        }
        //HttpContext.Current.Session["CustodialGroup"]="";
        public static Custodialgroup[] GetCustodialGroup()
        {
            Custodialgroup[] c = getParams().data.CustodialGroup;
            if (HttpContext.Current.Session["CustodialGroup"] !=null) {
                int v = int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.CustodialGroup;
                    var name = elem.Name;

                    if (elem.CustodialGroup == v)
                    {
                        c[0] = new Custodialgroup(id, name);
                    }
                }
            }
         
            /// new Custodialgroup(int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString()),);
          
         
            return c;//getParams().data.CustodialGroup;
        }

        public static string GetInceptionDate()
        {
            /*  Custodialgroup[] c = getParams().data.CustodialGroup;
              if (HttpContext.Current.Session["CustodialGroup"] != null)
              {
                  int v = int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString());

                  foreach (var elem in c)
                  {
                      var id = elem.CustodialGroup;
                      var name = elem.Name;

                      if (elem.CustodialGroup == v)
                      {
                          c[0] = new Custodialgroup(id, name);
                      }
                  }
              }*/

            /// new Custodialgroup(int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString()),);


            return HttpContext.Current.Session["InceptionDate"].ToString();//getParams().data.CustodialGroup;
        }




        public static ParamsClientForm.Country[] GetCountry()
        {
            ParamsClientForm.Country[] c = getParams().data.Country;

            if (HttpContext.Current.Session["Country"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Country"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.ID;
                    var name = elem.Name;

                    if (elem.ID == v)
                    {
                        c[0] = new ParamsClientForm.Country(id, name);
                    }
                }
            }
            return c;
        }

        public static ParamsClientForm.City[] GetCity()
        {
            ParamsClientForm.City[] c = getParams().data.City;

            if (HttpContext.Current.Session["City"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["City"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.ID;
                    var name = elem.Name;

                   if (elem.ID == v)
                     {
                         c[0] = new ParamsClientForm.City(id, name);
                     }
                }
            }
            return c;
        }

        public static IEnumerable GetCity(int PhysicalCountry)
        {
           // PhysicalCountry = 4;
            //    City[] c = getParams().data.City;
            ParamsClientForm.City[] c = Array.FindAll(getParams().data.City, ct => ct.CountryID == PhysicalCountry).ToArray();
          //  return from c in ParamsClientForm.City
             //     where c.PhysicalCountry == PhysicalCountry //countryID
             //      select c;

            /** if (HttpContext.Current.Session["City"] != null)
             {
                 int v = int.Parse(HttpContext.Current.Session["City"].ToString());

                 foreach (var elem in c)
                 {
                     var id = elem.ID;
                     var name = elem.Name;

                     if (elem.ID == v)
                     {
                         c[0] = new City(id, name);
                     }
                 }
             }*/
            return c;
        }
        public static RiskRating[] GetRiskRating()
        {
            RiskRating[] c = getParams().data.RiskRating;
          
                 if (HttpContext.Current.Session["ClientRisk"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["ClientRisk"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.ClientRisk;
                    var name = elem.Name;

                    if (elem.ClientRisk == v)
                    {
                        c[0] = new RiskRating(id, name);
                    }
                }
            }
            return c;
        }


        public static Sector[] GetSector()
        {
            Sector[] c = getParams().data.Sector;

            if (HttpContext.Current.Session["Sector"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Sector"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.ID;
                    var name = elem.Name;

                    if (elem.ID == v)
                    {
                        c[0] = new Sector(id, name);
                    }
                }
            }
            return c;
        }
        
        public static ParamsClientForm.Sex[] GetSex1()
        {
            ParamsClientForm.Sex[] c = getParams().data.Sex;

            if (HttpContext.Current.Session["Sex"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Sex"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.SexType;
                    var name = elem.SexName;

                    if (elem.ID == v)
                    {
                        c[0] = new ParamsClientForm.Sex(id, name);
                    }
                }
            }
            return c;
        }

        public static Identificationtype[] GetIdentification()
        {
            /* Identificationtype[] c = getParams().data.IdentificationType;

             if (HttpContext.Current.Session["Identificationtype"] != null)
             {
                 int v = int.Parse(HttpContext.Current.Session["Identificationtype"].ToString());

                 foreach (var elem in c)
                 {
                     var id = elem.IdentificationType;
                     var name = elem.Name;
                     var corp = elem.Corporate;

                     if (elem.IdentificationType.Equals(v))
                     {
                         c[0] = new Identificationtype(id, name,corp);
                     }
                 }
             }*/
            ParamsClientForm.Identificationtype[] c = Array.FindAll(getParams().data.IdentificationType, ct => ct.Corporate == 0).ToArray();
            return c;
        }

        public static ClientGroup[] GetClientGroup()
        {
            ClientGroup[] c = getParams().data.ClientGroup;

            if (HttpContext.Current.Session["ClientGroup"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["ClientGroup"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.clientGroup;
                    var name = elem.Name;

                    if (elem.ID == v)
                    {
                        c[0] = new ClientGroup(id, name);
                    }
                }
            }
            return c;
        }

        public static SourceOfIncome[] GetSourceOfIncome()
        {
            SourceOfIncome[] c = getParams().data.SourceOfIncome;

            if (HttpContext.Current.Session["SourceOfIncome"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["SourceOfIncome"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.IncomeType;
                    var name = elem.Name;

                    if (elem.ID == v)
                    {
                        c[0] = new SourceOfIncome(id, name);
                    }
                }
            }
            return c;
        }

        public static Branch[] GetBranch()
        {
            Branch[] c = getParams().data.Branch;

            if (HttpContext.Current.Session["Branch"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Branch"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.BranchID;
                    var name = elem.Name;

                    if (elem.ID == v)
                    {
                        c[0] = new Branch(id, name);
                    }
                }
            }
            return c;
        }
        #region GetTitle
        public static Salutationtype[] GetTitle()
        {
            Salutationtype[] c = getParams().data.SalutationType;

            if (HttpContext.Current.Session["Salutationtype"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Salutationtype"].ToString());

                foreach (var elem in c)
                {
                    var Type = elem.Type;
                    var Name = elem.Name;

                    if (Type.Equals(v.ToString()))
                    {
                        c[0] = new Salutationtype(Type, Name);
                    }
                }
            }
            return c;
        }
        
        public static ParamsClientForm.Sex[] GetSex()
        {
            ParamsClientForm.Sex[] c = getParams().data.Sex;

            if (HttpContext.Current.Session["Sex"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Sex"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.ID;
                    var Name = elem.Name;

                    if (id==v)
                    {
                        c[0] = new ParamsClientForm.Sex(id, Name);
                    }
                }
            }
            return c;
        }

        public static ParamsClientForm.Nationality[] GetNationality()
        {
            ParamsClientForm.Nationality[] c = getParams().data.Nationality;

            if (HttpContext.Current.Session["Nationality"] != null)
            {
                int v = int.Parse(HttpContext.Current.Session["Nationality"].ToString());

                foreach (var elem in c)
                {
                    var id = elem.ID;
                    var Name = elem.Name;

                    if (id == v)
                    {
                        c[0] = new ParamsClientForm.Nationality(id, Name);
                    }
                }
            }
            return c;
        }
        #endregion

        //public static String getIdenticationType1(int id)
        //{

        //    //  string conString = "Data Source=.\\SQLEXPRESS;Initial Catalog=GSAM_WEB;Integrated Security=True";
        //    SqlConnection con = new SqlConnection(Dbconnection.dbconnection());

        //    string selectSql = "SELECT  [Name] FROM tblIdentificationType where type=" + id;
        //    SqlCommand cmd = new SqlCommand(selectSql, con);

        //    try
        //    {
        //        con.Open();

        //        using (SqlDataReader read = cmd.ExecuteReader())
        //        {
        //            while (read.Read())
        //            {


        //                idType = (read["name"].ToString());

        //            }
        //        }
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }

        //    return idType;
        //}
        public static void WriteLogPost(string message)
        {
            using (FileStream file = new FileStream(System.Web.HttpContext.Current.Server.MapPath("~/postlogs.txt"), FileMode.Append, FileAccess.Write))
            {
                StreamWriter streamWriter = new StreamWriter(file);
                streamWriter.WriteLine(System.DateTime.Now.ToString() + ":" + message + "\n---\n");
                streamWriter.Close();
            }
        }
        public static string  ver() {
            String ra = "";

            Random rnd = new Random();

            for (int j = 0; j < 4; j++)
            {
                ra += rnd.Next(10);
                Console.WriteLine(rnd.Next(10));//returns random integers < 10
            }
            HttpContext.Current.Session["ClientNumGenerator"] = ra;


            if (int.Parse(verifyGeneratedClientNo(ra)) == 0)
            {
                HttpContext.Current.Session["ClientNumGenerator"] = ra;
            }
            else
            {
                String ra1 = "";

                Random rnd1 = new Random();

                for (int j = 0; j < 4; j++)
                {
                    ra1 += rnd1.Next(10);
                    HttpContext.Current.Session["ClientNumGenerator"] = ra;
                    Console.WriteLine(rnd1.Next(10));//returns random integers < 10
                }

            }
            return HttpContext.Current.Session["ClientNumGenerator"].ToString();
        }

        public static String verifyGeneratedClientNo(string id)
        {

            // string conString = "Data Source=.\\SQLEXPRESS;Initial Catalog=GSAM_WEB;Integrated Security=True";
            SqlConnection con = new SqlConnection(Dbconnection.dbconnection());
            String v = "";
            string selectSql = "SELECT COUNT(*) as rec_count FROM(select ClientNo from tblCounterparty where ClientNo=" + "'" + id + "'" + ")h";
            SqlCommand cmd = new SqlCommand(selectSql, con);

            try
            {
                con.Open();

                using (SqlDataReader read = cmd.ExecuteReader())
                {
                    while (read.Read())
                    {


                        v = (read["rec_count"].ToString());

                    }
                }
            }
            finally
            {
                con.Close();
            }

            return v;
        }
        public static void NewClients(ClientDetailsDataUpdate1 emp)
        {
            ClientMDL newClient = new ClientMDL();
            {
                // newClient.CounterpartyType = int.Parse(HttpContext.Current.Session["ClientTypeSec"].ToString());
                newClient.ClientNo = ver();//"0";// emp.ClientNo;//txtclientno.Text;//HttpContext.Current.Session["SelectedClientID"].ToString();
                newClient.Name = emp.Name;
                newClient.Name2 = emp.Name2;
                newClient.Name3 = emp.Name3;      
                newClient.Corporate = false;
                newClient.SalutationType = emp.SalutationType;//;int.Parse(salutationtype.Value.ToString());
                newClient.DateOfBirth = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.SexType = emp.SexType;
                newClient.IndustryType = 0;
                newClient.RegistrationOffice = "";
                newClient.VATRegistrationNo = "";
                newClient.TaxStatus = true;
                newClient.WithholdingTaxStatus = emp.WithholdingTaxStatus == 1 ? true : false;
                newClient.ResidentShareholdersTaxStatus = false;
                newClient.IdentificationType = emp.IdentificationType; //(@drpIdentificationType.Value == null ? 0 : (int)drpIdentificationType.Value);
                newClient.IdentificationNo = emp.IdentificationNo;//IdentificationNo.Text;
                newClient.AgentID = 0;
                newClient.CustodialID = 0;
                newClient.CounterpartyType = int.Parse(HttpContext.Current.Session["ClientTypeSec"].ToString());///(@cboCounterpartyType.Value == null ? 0 : (int)cboCounterpartyType.Value);
                newClient.CustodialGroup = emp.CustodialGroup;//int.Parse(cust.Value.ToString());// (cboCustodialGroup.Value == null ? 0 : (int)cboCustodialGroup.Value);
                //newClient.InceptionDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.SpecialInstructions = //physicalAddress.Text;
                newClient.BranchID = emp.BranchID.ToString();//int.Parse(branch.ToString());//int.Parse(cboBranch.Value.ToString()); //(@cboBranch.Value == null ? 0 : (int)cboBranch.Value);
                newClient.PhysicalAddress = emp.PhysicalAddress;//physicalAddress.Text;
                newClient.PhysicalAddress2 = emp.PhysicalAddress2;//physicalAddress2.Text; ;
                newClient.PhysicalAddress3 = "";
                newClient.PhysicalCity = 1;//(@cboCity.Value == null ? 0 : (int)cboCity.Value);
                newClient.PhysicalCountry = 1; //(cboCountry.Value == null ? 0 : (int)cboCountry.Value);
                newClient.PostalAddress = emp.PostalAddress;//postaAddress.Text;
                newClient.PostalAddress2 = emp.PostalAddress2;//postaAddress2.Text;
                newClient.PostalAddress3 = "";
                newClient.PostalCity = 1;// (@cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PostalCountry = 1;// (cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PhoneNo = emp.PhoneNo;//phone.Text;
                newClient.PhoneNo2 = emp.PhoneNo2;//phone2.Text;
                newClient.PhoneNo3 = emp.PhoneNo3;//phone2.Text;
                newClient.FaxNo = "";
                newClient.EmployerName = emp.EmployerName;
                newClient.EmployerPhysicalAddress = emp.EmployerPhysicalAddress;
                newClient.EmployerPhysicalAddress2 = emp.EmployerPhysicalAddress2;
                newClient.EmployerPhysicalAddress3 = "";
                newClient.EmployerPhysicalCity = emp.EmployerPhysicalCity;
                newClient.EmployerPhysicalCountry = emp.EmployerPhysicalCountry;
                newClient.EmployerPostalAddress = emp.EmployerPostalAddress;
                newClient.EmployerPostalAddress2 = emp.EmployerPostalAddress2;
                newClient.EmployerPostalAddress3 = "";
                newClient.EmployerPostalCity = emp.EmployerPostalCity;
                newClient.EmployerPostalCountry = emp.EmployerPostalCountry;
                newClient.EmployerPhoneNo = emp.EmployerPhoneNo;
                newClient.EmployerPhoneNo2 = "";
                newClient.EmployerFaxNo = "";
                newClient.EmailAddress = emp.EmailAddress;// email3.Text;
                newClient.EmailAddress2 = emp.EmailAddress2;
                newClient.EmailStatement = emp.EmailStatement == 1 ? true : false;
                newClient.HoldStatement = emp.HoldStatement == 1 ? true : false;
                newClient.Dimension = "";
                newClient.Dimension2 = "";
                newClient.Dimension3 = "";
                newClient.Dimension4 = "";
                newClient.Dimension5 = "";
                newClient.CreditLimit = 0;
                newClient.DebitLimit = 0;
                newClient.SettlementLimit = 0;
                newClient.Active = true;//emp.Active == 1 ? true : false;// (bool)chkActive.Value;
                newClient.ClientID = 0;//HttpContext.Current.Session["SelectedClientID"].ToString();
                newClient.Update = 0;
                newClient.Delete = 0;
                newClient.UpfrontFee = emp.UpfrontFee;//(bool)chkUpfrontFee.Value;
                newClient.IncomeTaxNo = "";
                newClient.ManagedClient = emp.ManagedClient == 1 ? true : false;// (bool)chkManaged.Value;
                newClient.FundAdmin = 0;
                newClient.ClientGroup = 1;// (@cboClientGroup.Value == null ? 0 : (int)cboClientGroup.Value);
                newClient.IsFundAdmin = emp.IsFundAdmin == 1 ? true : false;
                newClient.IncomeType = emp.IncomeType;//int.Parse(cboIncomeType.Value.ToString()); //(@cboIncomeType.Value == null ? 0 : (int)cboIncomeType.Value);
                newClient.Nationality = 1;
                newClient.DividendWTax = 0;
                newClient.Citizenship = 1;
                newClient.Sector = emp.Sector;//int.Parse(cboSector.Value.ToString());//(@cboSector.Value == null ? 0 : (int)cboSector.Value);
                newClient.IncomeSource = emp.IncomeSource;//int.Parse(cboSourceOfIncome.Value.ToString());// (@cboSourceOfIncome.Value == null ? 0 : (int)cboSourceOfIncome.Value);
                newClient.ClientRisk = emp.ClientRisk;//int.Parse(cboRiskRating.Value.ToString()); //(@cboRiskRating.Value == null ? 0 : (int)cboRiskRating.Value);
                newClient.IsUSResident = emp.IsUSResident == 1 ? true : false;// (bool)chkIsUSResident.Value;

                newClient.HasUSGreenCard = emp.HasUSGreenCard == 1 ? true : false; //(bool)chkGreenCardHolder.Value;

                newClient.EstimatedAnnualSales = emp.EstimatedAnnualSales;
                newClient.EstimatedTransPerMonth = emp.EstimatedTransPerMonth;
                newClient.AnticipatedTransPerMonth = emp.AnticipatedTransPerMonth;
                newClient.AnticipatedTotalAmount = emp.AnticipatedTotalAmount;
                newClient.ExpiryDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.GovRegNo = emp.GovRegNo;//txtGovRegNo.Text;
                newClient.RelationshipManager = 0;
                newClient.Citizenship2 = emp.Citizenship2;
                newClient.GovBody = "";
                newClient.SendSMS = emp.SendSMS == 1 ? true : false;//(bool)chkSendSms.Value;
                newClient.BPNumber= emp.BPNumber;
                newClient.UseGlobalPortfolioModel = "1";
                newClient.LedgerFee = emp.LedgerFee==1?true:false;
                newClient.CountryOfResidence = 1;// (@drpCountryOfResidence.Value == null ? 0 : (int)drpCountryOfResidence.Value);
                newClient.VFXNumber = emp.VFXNumber;//txtVfxAccountNumber.Text;
                newClient.ZSENumber = emp.ZSENumber;//txtZseAccountNumber.Text;
              
            }


            try
            {

                var webClient = new WebClient();
                {
                    //webClient.BaseAddress = "http:localhost:93/gsam";
                    var url = "http://localhost:93/gsam/api/client/create_update";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(newClient);
                    var response = webClient.UploadString(url, data);
                    var result = JsonConvert.DeserializeObject<Jresponse>(response);
                    System.Console.WriteLine(result);

                    //Session["SelectedClientID"] = result.data.ClientID;
                    //    Response.Redirect("aaac.aspx");

                    //  String cv = HttpContext.Current.Request.RawUrl;
                    // String message = "new Individual Account Successfully Saved";
                    //  Response.Redirect("webForm2.aspx?param1=" + EncryptionHelper.Encrypt(message) + "&param2=" + EncryptionHelper.Encrypt(cv));

                    //  throw new InvalidStudentNameException(result.message);
                    //   HttpContext.Current.Session["UpdateMessage"] = result.message + "& Update ID=" + result.data;

                    if (result.data != null)
                    {
                        HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data.ClientID;
                        WriteLogPost(data + " -----Message----" + result.message + "-----data---" + result.data.ClientID);

                    }
                    else
                    {
                        HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data;
                        WriteLogPost(data + " -----Message----" + result.message + "-----data---" + result.data);

                    }
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void UpdateClients(ClientDetailsDataUpdate1 emp)
        {
   
            ClientMDL newClient = new ClientMDL();
            {
                newClient.CounterpartyType = int.Parse(HttpContext.Current.Session["ClientTypeSec"].ToString());
                newClient.Name = emp.Name;
                newClient.Name2 = emp.Name2;
                newClient.Name3 = emp.Name3;
                newClient.ClientNo = emp.ClientNo;//txtclientno.Text;//HttpContext.Current.Session["SelectedClientID"].ToString();
                newClient.Corporate = false;
                newClient.SalutationType = emp.SalutationType;//;int.Parse(salutationtype.Value.ToString());
                newClient.DateOfBirth = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.IndustryType = 0;
                newClient.RegistrationOffice = "";
                newClient.VATRegistrationNo = "";
                newClient.BPNumber = "0";
                newClient.TaxStatus = true;
                newClient.WithholdingTaxStatus = emp.WithholdingTaxStatus==1?true:false;
                newClient.ResidentShareholdersTaxStatus =false;
                newClient.IdentificationType = emp.IdentificationType; //(@drpIdentificationType.Value == null ? 0 : (int)drpIdentificationType.Value);
                newClient.IdentificationNo = emp.IdentificationNo;//IdentificationNo.Text;
                newClient.AgentID = 0;
                newClient.CustodialID = 0;
                newClient.CounterpartyType = 0;///(@cboCounterpartyType.Value == null ? 0 : (int)cboCounterpartyType.Value);
                newClient.CustodialGroup = emp.CustodialGroup;//int.Parse(cust.Value.ToString());// (cboCustodialGroup.Value == null ? 0 : (int)cboCustodialGroup.Value);
               // newClient.InceptionDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.SpecialInstructions = //physicalAddress.Text;
                newClient.BranchID = emp.BranchID.ToString();//int.Parse(branch.ToString());//int.Parse(cboBranch.Value.ToString()); //(@cboBranch.Value == null ? 0 : (int)cboBranch.Value);
                newClient.PhysicalAddress = emp.PhysicalAddress;//physicalAddress.Text;
                newClient.PhysicalAddress2 = emp.PhysicalAddress2;//physicalAddress2.Text; ;
                newClient.PhysicalAddress3 = "";
                newClient.PhysicalCity = emp.PhysicalCity;//(@cboCity.Value == null ? 0 : (int)cboCity.Value);
                newClient.PhysicalCountry = emp.PhysicalCountry; //(cboCountry.Value == null ? 0 : (int)cboCountry.Value);
                newClient.PostalAddress = emp.PostalAddress;//postaAddress.Text;
                newClient.PostalAddress2 = emp.PostalAddress2;//postaAddress2.Text;
                newClient.PostalAddress3 = "";
                newClient.PostalCity = 1;// (@cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PostalCountry = 1;// (cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PhoneNo = emp.PhoneNo;//phone.Text;
                newClient.PhoneNo2 = emp.PhoneNo2;//phone2.Text;
                newClient.PhoneNo3 = emp.PhoneNo3;//phone2.Text;
                newClient.FaxNo = emp.FaxNo;
                newClient.EmployerName = emp.EmployerName;
                newClient.EmployerPhysicalAddress = emp.EmployerPhysicalAddress;
                newClient.EmployerPhysicalAddress2 = emp.EmployerPhysicalAddress2;
                newClient.EmployerPhysicalAddress3 = "";
                newClient.EmployerPhysicalCity = emp.EmployerPhysicalCity;
                newClient.EmployerPhysicalCountry = emp.EmployerPhysicalCountry;
                newClient.EmployerPostalAddress = emp.EmployerPostalAddress;
                newClient.EmployerPostalAddress2 = emp.EmployerPostalAddress2;
                newClient.EmployerPostalAddress3 = "";
                newClient.EmployerPostalCity = emp.EmployerPostalCity;
                newClient.EmployerPostalCountry = emp.EmployerPostalCountry;
                newClient.EmployerPhoneNo = emp.EmployerPhoneNo;
                newClient.EmployerPhoneNo2 = "";
                newClient.EmployerFaxNo = "";
                newClient.EmailAddress = emp.EmailAddress;// email3.Text;
                newClient.EmailAddress2 = emp.EmailAddress2;
                newClient.EmailStatement = emp.EmailStatement==1?true:false;
                newClient.HoldStatement = emp.HoldStatement==1?true:false;
                newClient.Dimension = "";
                newClient.Dimension2 = "";
                newClient.Dimension3 = "";
                newClient.Dimension4 = "";
                newClient.Dimension5 = "";
                newClient.CreditLimit = 0;
                newClient.DebitLimit = 0;
                newClient.SettlementLimit = 0;
                newClient.Active = emp.Active==1?true:false;// (bool)chkActive.Value;
                newClient.ClientID = HttpContext.Current.Session["SelectedClientID"].ToString();
                newClient.Update = 1;
                newClient.Delete = 0;
                newClient.UpfrontFee = emp.UpfrontFee;//(bool)chkUpfrontFee.Value;
                newClient.IncomeTaxNo = "";
                newClient.ManagedClient = emp.ManagedClient==1?true:false;// (bool)chkManaged.Value;
                newClient.LedgerFee = emp.LedgerFee==1?true:false;// (bool)chkLedgerFees.Value;
                newClient.FundAdmin = 0;
                newClient.ClientGroup = 1;// (@cboClientGroup.Value == null ? 0 : (int)cboClientGroup.Value);
                newClient.IsFundAdmin = emp.IsFundAdmin==1?true:false;
                newClient.IncomeType = emp.IncomeType;//int.Parse(cboIncomeType.Value.ToString()); //(@cboIncomeType.Value == null ? 0 : (int)cboIncomeType.Value);
                newClient.Nationality = 1;//int.Parse(drpNationality.Value.ToString()); //(@drpNationality.Value == null ? 0 : (int)drpNationality.Value);
                newClient.Citizenship = 1;//int.Parse(cboCitizenship.Value.ToString()); //(@cboCitizenship.Value == null ? 0 : (int)cboCitizenship.Value);
                newClient.Citizenship2 = 1; //int.Parse(cboCitizenship.Value.ToString()); //(cboSecondCitizenship.Value == null ? 0 : (int)cboSecondCitizenship.Value);
                newClient.HasUSGreenCard = emp.HasUSGreenCard==1?true:false; //(bool)chkGreenCardHolder.Value;
                newClient.IsUSResident = emp.IsUSResident==1?true:false;// (bool)chkIsUSResident.Value;
                newClient.DividendWTax = 0;
                newClient.Sector = emp.Sector;//int.Parse(cboSector.Value.ToString());//(@cboSector.Value == null ? 0 : (int)cboSector.Value);
                newClient.IncomeSource = emp.IncomeSource;//int.Parse(cboSourceOfIncome.Value.ToString());// (@cboSourceOfIncome.Value == null ? 0 : (int)cboSourceOfIncome.Value);
                newClient.ClientRisk = emp.ClientRisk;//int.Parse(cboRiskRating.Value.ToString()); //(@cboRiskRating.Value == null ? 0 : (int)cboRiskRating.Value);
                newClient.EstimatedAnnualSales = emp.EstimatedAnnualSales;
                newClient.EstimatedTransPerMonth = emp.EstimatedTransPerMonth;
                newClient.AnticipatedTransPerMonth = emp.AnticipatedTransPerMonth;
                newClient.AnticipatedTotalAmount = emp.AnticipatedTotalAmount;
                newClient.ExpiryDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.GovRegNo = emp.GovRegNo;//txtGovRegNo.Text;
                newClient.RelationshipManager = 0;
                newClient.GovBody = "";
                newClient.UseGlobalPortfolioModel = "";
                newClient.CountryOfResidence = 1;// (@drpCountryOfResidence.Value == null ? 0 : (int)drpCountryOfResidence.Value);
                newClient.SendSMS = emp.SendSMS==1?true:false;//(bool)chkSendSms.Value;
                newClient.VFXNumber = emp.VFXNumber;//txtVfxAccountNumber.Text;
                newClient.ZSENumber = emp.ZSENumber;//txtZseAccountNumber.Text;
                newClient.SexType = emp.SexType;//int.Parse(sex.Value.ToString());// (cboGender.Value == null ? 0 : (int)cboGender.Value);
            }


            try
            {

                var webClient = new WebClient();
                {
                    //webClient.BaseAddress = "http:localhost:93/gsam";
                    var url = "http://localhost:93/gsam/api/client/create_update";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(newClient);
                    var response = webClient.UploadString(url, data);
                    var result = JsonConvert.DeserializeObject<Jresponse>(response);
                    System.Console.WriteLine(result);

                    if (result.data != null)
                    {
                        HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data.ClientID;
                        WriteLogPost(data + " -----Message----" + result.message + "-----data---" + result.data.ClientID);

                    }
                    else
                    {
                        HttpContext.Current.Session["UpdateMessage"] = result.message + "& Updated ClientID=" + result.data;
                        WriteLogPost(data + " -----Message----" + result.message + "-----data---" + result.data);

                    }

                    // HttpContext.Current.Session["UpdateMessage"] = result.message+ "& Updated ClientID="+result.data.ClientID;
                    // throw new InvalidStudentNameException(result.message);

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