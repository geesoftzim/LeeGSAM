using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace LastTrialGene.Models
{
    public class ParamsClientBankDetails
    {

    

        public class BankDetailsMDL
        {
            public string server { get; set; } = "OPTIMUSPRIME";
            public string user { get; set; } = "debugger";
            public string password { get; set; } = "bug";
            public string database { get; set; } = "GSAMUP";

            public int ID { get; set; }
            public int ClientID { get; set; }
            public int BankID { get; set; }
            public int AccountType { get; set; }
            public string AccountName { get; set; }
            public string AccountNo { get; set; }
            public int BankDetailsID { get; set; }
            public string BranchCode { get; set; }
            public bool Update { get; set; }
            public bool Delete { get; set; }



            public class BankDetailsListPost
            {
                public string server { get; set; }
                public string database { get; set; }
                public string user { get; set; }
                public string password { get; set; }
                public int ClientID { get; set; }
            }
    


        public class BankDetailsDataReturn
            {
                public string status { get; set; }
                public string message { get; set; }
                public List<BankDetailsData> data { get; set; }
            }

  

            public class BankDetailsData
            {
                public int ID { get; set; }
                public int ClientID { get; set; }
                public int BankID { get; set; }
                public int AccountType { get; set; }
                public string AccountName { get; set; }
                public string AccountNo { get; set; }
                public string BankName { get; set; }
                public string BranchName { get; set; }
                public string AccountTypeName { get; set; }
            }

        }
        public class BankDetailsListPost
        {
            public string server { get; set; }
            public string database { get; set; }
            public string user { get; set; }
            public string password { get; set; }
            public int ClientID { get; set; }
        }
        public class BankDetailsDataReturn
        {
            public string status { get; set; }
            public string message { get; set; }
            public List<BankDetailsData> data { get; set; }
        }

        public class BankDetailsDataReturn2
        {
            public string status { get; set; }
            public string message { get; set; }
            public List<BankDetailsData2> data { get; set; }
        }

        public class BankDetailsDataReturn3
        {
            public string status { get; set; }
            public string message { get; set; }
            public List<BankDetailsMDL> data { get; set; }
        }




        private class Post
        {
            public string server { get; set; }
            public string user { get; set; }
            public string password { get; set; }
            public string database { get; set; }
            public int ID { get; set; }
        }

        public class BankDetailsParams
        {
            public string status { get; set; }
            public string message { get; set; }
            public BankDetailsData data { get; set; }
        }

        public class BankDetailsData
        {
            public BankAccountType[] BankAccountType { get; set; }
            public Bank[] Banks { get; set; }
            public Bankbranch[] BankBranch { get; set; }
        }

        public class BankAccountType
        {
            public BankAccountType(string Type, string Name)
            {
                this.AccountType = Type;
                this.AccountTypeName = Name;
            }
            public string Type { get; set; }
            public string Name { get; set; }
            
                    public string AccountType { get; set; }
            public string AccountTypeName { get; set; }
            
        }

        public class Bank
        {
            public int ID { get; set; }
            
           public int BankID { get; set; }
            public string Name { get; set; }
            public string BankName { get; set; }

            public Bank(int ID, string Name) {
                this.BankID = ID;
                this.BankName = Name;
            
            }
        }

        public class Bankbranch
        {
            public int ID { get; set; }
            public int BranchID { get; set; }
            public string Name { get; set; }
            
            public string BranchName { get; set; }
            public string BranchNo { get; set; }
            /// <summary>
            //Mubikirwa just objectmap
            /// </summary>
            public int BankID { get; set; }
            public string BankName { get; set; }
          

            public  Bankbranch(int ID, string BranchName,string Name) { 
                this.BankID = ID;
                this.BankName = BranchName;
                this.BranchName = Name; 
            }

        }
    }

    public class BankDetailsData2
    {
   /*     public BankDetailsData2(int ID, int ClientID,
            int BankID, int AccountType, string AccountName,
            string AccountNo, string BankName, string BranchName, string AccountTypeName)
        {
            this.ID = ID;
            this.ClientID = ClientID;
            this.BankID = BankID;
            this.AccountType = AccountType;
            this.AccountName = AccountName;
            this.AccountNo = AccountNo;
            this.BankName = BankName;
            this.BranchName = BranchName;
            this.AccountTypeName = AccountTypeName;
        }
        */
    /*    public BankDetailsData2(int ID, int ClientID,
     int BankID, int AccountType, string AccountName,
     string AccountNo)
        {
            this.ID = ID;
            this.ClientID = ClientID;
            this.BankID = BankID;
            this.AccountType = AccountType;
            this.AccountName = AccountName;
            this.AccountNo = AccountNo;
        }*/



        public int ID { get; set; }
        public int ClientID { get; set; }
        public int BankID { get; set; }
        public int AccountType { get; set; }
        public string AccountName { get; set; }
        public string AccountNo { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public string AccountTypeName { get; set; }

        
    }
}