using DevExpress.Xpo;
using LastTrialGene.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;


namespace LastTrialGene.TradingAccountsContext
{
    public class ClientAccountsMDL
    {
        public string server { get; set; } = "OPTIMUSPRIME";
        public string user { get; set; } = "debugger";
        public string password { get; set; } = "bug";
        public string database { get; set; } = "GSAMUP";

        public int ClientID { get; set; }
        public string AccountNo { get; set; }
        public string Narrative { get; set; }
        public int AccountType { get; set; }
        public int CustodialGroup { get; set; }
        public int InterestGroup { get; set; }
        public bool GlobalInterest { get; set; }
        public int InterestRate { get; set; }
        public int ManagementFeePeriodType { get; set; }
        public int GlobalManagementFee { get; set; }
        public int ManagementFeeRate { get; set; }
        public int CurrencyID { get; set; }
        public bool Active { get; set; }
        public bool Blocked { get; set; }
        public int UnitTrustID { get; set; }
        public int AccountID { get; set; }
        public int Update { get; set; }
        public int Delete { get; set; }
        public int GlobalMinimumInterestBalance { get; set; }
        public int MinimumInterestBalance { get; set; }
        public int ManagementFeeType { get; set; }
        public int FlatManagmentFee { get; set; }
        public int ManagementFeeInclUT { get; set; }

    }

    public class Params {
        public string status { get; set; }
        public string message { get; set; }
        public Data data { get; set; }
    }
    public class CustodialGroup
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int CustodialGroupName { get; set; }
        

        public CustodialGroup(int ID, string Name)
        {
            this.CustodialGroupName = ID;
            this.Name = Name;
        }

    }
    public class AccountType
    {
        public string Type { get; set; }
        public string AccountTypeName { get; set; }

        public string Name { get; set; }

        public AccountType(string Type, string Name)
        {
            this.AccountTypeName = Type;
            this.Name= Name;
        }
    }

    public class PeriodType
{
    public string Type { get; set; }
    public string Name { get; set; }
        public string periodType { get; set; }

        public PeriodType(string Type, string Name)
        {
            this.periodType = Type;
            this.Name = Name;
        }
    }
    public class managementFeeType {
        public string Type { get; set; }
        public string Name { get; set; }
        public string ManagementFeeType { get; set; }

        public managementFeeType(string Type, string Name) {
            this.ManagementFeeType = Type;
            this.Name = Name;
        }

    }
    public class InterestGroup
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int InterestGroupName { get; set; }

        public InterestGroup(int ID, string Name)
        {
            this.InterestGroupName = ID;
            this.Name = Name;
        }

    }

    public class Currency
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string CurrCode { get; set; }
        public int CurrencyID { get; set; }

        public Currency(int ID, string CurrCode)
        {
            this.CurrencyID = ID;
            this.CurrCode = CurrCode;
        }

    }




        public class Data
    {
        public AccountType[] AccountType{ get; set; }
       public CustodialGroup[] CustodialGroup { get; set; }
        public managementFeeType[] ManagementFeeType { get; set; }
        public PeriodType[] PeriodType { get; set; }
        public InterestGroup[] InterestGroup { get; set; }
        public Currency[] Currency { get; set; }
        


    }

        public class ClientAccountsReturn
    {
        public string status { get; set; }
        public string message { get; set; }
        public ClientAccountsMDL[] data { get; set; }
    }


    public class AccountListPost
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int CounterpartyID { get; set; }
    }

    public class AccountListReturn
    {
        public string status { get; set; }
        public string message { get; set; }
        public List<AccountList> data { get; set; }
    }

    public class CreationDate
    {
        public string date { get; set; }
        public int timezone_type { get; set; }
        public string timezone { get; set; }
    }

    public class AccountList
    {
        public string ID { get; set; }
        public string AccountNo { get; set; }
        public string Narrative { get; set; }
        public string AccountName { get; set; }
        public string AccountTypeName { get; set; }
        public string CounterpartyTypeName { get; set; }
        public object InterestGroupName { get; set; }
        public string CustodialGroupName { get; set; }
        public string InterestRate { get; set; }
        public string ManagementFeeRate { get; set; }
        ////////////////////
       public int periodType { get; set; }
        public int CurrencyID { get; set; }
        public int CustGroupNotAppl { get; set; }

        public int ManagementFeeType { get; set; }
        public string ClientNO { get; set; }

        public string ClientName { get; set; }
        public Decimal AccMinimumBal { get; set; }

        public int GlobalInterestRate { get; set; }
        public int GlobalMinBal { get; set; }

        public int GlobalManageFeeRate { get; set; }
        public int GlobalManageFeeValue { get; set; }

        public int calcManageFeeAsPercRate { get; set; }
        public int SetManageFeeAsflatFee { get; set; }

        public string CreditLimit { get; set; }
        public string DebitLimit { get; set; }

        public string ActualCredit { get; set; }
        public string ActualDebit { get; set; }

      



        ///////////////////////////////

        public int Active { get; set; }
        public int Blocked { get; set; }
        public string ActualBalance { get; set; }
        public string AvailableBalance { get; set; }
        public string Username { get; set; }
        //public CreationDate CreationDate { get; set; }
        public string CreationDate { get; set; }
        public string CurrCode { get; set; }
        public int Status { get; set; }
    }

    public static class TradingAccountsContext {

        public static Params getParams()
        {

            Params cp;
            var client = new HttpClient();
            {
                var endpoint = new Uri("http://localhost:93/gsam/api/client/account_params");
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



                cp = new Params();
                cp = JsonConvert.DeserializeObject<Params>(result);




            }
            return cp;
        }

        public static List<AccountList> GetAccounts()
        {
            if (HttpContext.Current.Session["SelectedClientID"] != null){
                try
                {
                    //client trading accounts not bank details

                    AccountListPost accountsList = new AccountListPost();
                    {
                        accountsList.server = "OPTIMUSPRIME";
                        accountsList.database = "GSAMUP";
                        accountsList.user = "debugger";
                        accountsList.password = "bug";
                        accountsList.CounterpartyID = int.Parse(HttpContext.Current.Session["SelectedClientID"].ToString());
                    }

                    var webClient = new WebClient();
                    {
                        var url = "http://localhost:93/gsam/api/client/account_list";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(accountsList);
                        var response = webClient.UploadString(url, data);
                        AccountListReturn result = JsonConvert.DeserializeObject<AccountListReturn>(response);
                        return result.data;

                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else {
                return new List<AccountList>();
            }
   
        }

        public static AccountType[] GetAccountType()
        {
            AccountType[] c = getParams().data.AccountType;
            return c;
        }

        public static CustodialGroup[] GetCustodialGroup()
        {
            CustodialGroup[] c = getParams().data.CustodialGroup;
            return c;
        }

        public static managementFeeType[] GetManagementFeeType()
        {
            managementFeeType[] c = getParams().data.ManagementFeeType;
            return c;
        }

        public static PeriodType[] GetPeriodType()
        {
            PeriodType[] c = getParams().data.PeriodType;
            return c;
        }

        public static InterestGroup[] GetInterestGroup()
        {
            InterestGroup[] c = getParams().data.InterestGroup;
            return c;
        }

        public static Currency[] GetCurrency()
        {
            Currency[] c = getParams().data.Currency;
            return c;
        }
        





    }
}