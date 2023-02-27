using DevExpress.DocumentServices.ServiceModel.DataContracts;
using LastTrialGene.ContactsContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static LastTrialGene.Models.ParamsClientForm;

namespace LastTrialGene.Models
{
    public class ParamsClientForm
    {
        public class ClientIdMDL
        {
            public string server { get; set; } = "OPTIMUSPRIME";
            public string user { get; set; } = "debugger";
            public string password { get; set; } = "bug";
            public string database { get; set; } = "GSAMUP";
            public int ID { get; set; }
        }



        public class ClientParams
        {
            public string status { get; set; }
            public string message { get; set; }
            public Data data { get; set; }

            public ClientParams(string status,string message,Data data) {
                this.status = status;
                this.message = message;
                this.data = data;
            }
            public ClientParams() { 
            }
        }

        public class Data
        {
            public Custodialgroup[] CustodialGroup { get; set; }
            public Counterpartytype[] CounterpartyType { get; set; }
            public Salutationtype[] SalutationType { get; set; }
            public Identificationtype[] IdentificationType { get; set; }
            public Sex[] Sex { get; set; }
            public nationality[] Nationality { get; set; }
            public Country[] Country { get; set; }
            public City[] City { get; set; }
            public Sector[] Sector { get; set; }
            public SourceOfIncome[] SourceOfIncome { get; set; }
            public RiskRating[] RiskRating { get; set; }
            public ClientGroup[] ClientGroup { get; set; }
            public Branch[] Branch { get; set; }
            public RelationshipManager[] RelationshipManager { get; set; }
        }

        public class CustodialgroupMapper {
            List<Custodialgroup> CustodialGroup { get; set; }
            int taken { get; set; }

            public CustodialgroupMapper(List<Custodialgroup>CustodialGroup, int taken)
            {
                this.CustodialGroup = CustodialGroup;
                this.taken= taken;
            }
        }
        public class Custodialgroup
        {
            public int ID { get; set; }
            public string Name { get; set; }
            
          public int CustodialGroup { get; set; }
            public Custodialgroup(int ID, string Name)
            {
                this.CustodialGroup = ID;
                this.Name= Name;
              
            }

        }

        public class Counterpartytype
        {
            public int Type { get; set; }
            public string Name { get; set; }
        }

        public class Salutationtype
        {
            public Salutationtype(string Type, string Name) {
                this.Type= Type;
                this.Name= Name;
                this.SalutationType = Type;
            }
            public string Type { get; set; }
            public string SalutationType { get; set; }
            
            public string Name { get; set; }
        }

        public class Identificationtype
        {
            public string Type { get; set; }
            public int Corporate { get; set; }
            public string Name { get; set; }

            public string IdentificationType { get; set; }
            
            public Identificationtype(string Type, string Name, int Corporate) {
                this.IdentificationType = Type;
                this.Corporate = Corporate;
                this.Name = Name;
            }


        }

        public class Sex
        {
            public Sex(int ID, string Name) { 
                this.SexType = ID;
                this.SexName = Name;
            }
            public int ID { get; set; }
            public int SexType { get; set; }
            public string Name { get; set; }
            public string SexName { get; set; }
        }

        public class nationality
        {
            public int ID { get; set; }
            public int Nationality { get; set; }
            public int Citizenship { get; set; }
            public int Citizenship2 { get; set; }
            public string Name { get; set; }
            public string imgUrl { get; set; }
            
            public nationality(int ID, string Name) { 
                this.ID= ID;
                this.Nationality = ID;
                this.Citizenship = ID;
                this.Citizenship2 = ID;
                this.Name= Name;
                this.imgUrl = imgUrl;// "~/Content/Images/flags/zimbabwe.png";
            }

        }

        

        public class Country
        {
       /*     public Country(int ID, string Name, string Country)
            {
                this.ID = ID;
                this.Name = Name;

                this.country = Name;

            }*/

            public Country(int ID, string Name)
            {
                this.ID = ID;
                this.Physicalcountry = ID;
                this.PostalCountry = ID;
                this.EmployerPhysicalCountry = ID;
                this.USResident = ID;
                this.IsUSResident =ID ; 
                this.imgUrl = imgUrl;
                
                this.country = Name;
            

            }
            public string imgUrl { get; set; }
            public int IsUSResident { get; set; }
            public int USResident { get; set; }
            public string country { get; set; }
            public int Physicalcountry { get; set; }
            public int EmployerPhysicalCountry { get; set; }
            
            public int PostalCountry { get; set; }
            public int ID { get; set; }
            public string Name { get; set; }
        }

        public class City
        {
            public int ID { get; set; }
            public string Name { get; set; }
            
            public string city { get; set; }
            public int EmployerPhysicalCity { get; set; }
            public int PhysicalCity { get; set; }
            public int PostalCity { get; set; }
            public int CountryID { get; set; }

            public City(int ID, string Name) {
                this.ID = ID; 
                this.PhysicalCity = ID;
                this.EmployerPhysicalCity = ID;
                this.PostalCity= ID;
                this.city = Name;
            }
        }
       
        public class Sector
        {
            public Sector(int ID, string Name) { 
                this.sector = ID;
                this.SectorName = Name;
            }
            public int ID { get; set; }
            public int sector { get; set; }
            public string Name { get; set; }
            public string SectorName { get; set; }
        }

        public class SourceOfIncome
        {
            public int ID { get; set; }
            
            public int IncomeType { get; set; }
            public int IncomeSource { get; set; }
            
            public string Name { get; set; }
            public SourceOfIncome(int ID, string Name) { 
                this.IncomeType = ID;
                this.IncomeSource = ID;
                this.Name= Name;
            
            }
        }

        public class RiskRating
        {
            public int ID { get; set; }
            public int ClientRisk { get; set; }
            public string Name { get; set; }
            public string RiskName { get; set; }
            public string imgUrl { get; set; }
            

            public RiskRating(int ID, string Name) { 
                this.ClientRisk = ID;
                this.RiskName = Name;
                this.imgUrl = imgUrl;
                
            }
        }

        public class ClientGroup
        {
            public ClientGroup(int ID, string Name) { 
            this.clientGroup = ID;
                this.Name= Name;

               
            }
            public int ID { get; set; }
            public int clientGroup { get; set; }
            
            public string Name { get; set; }
        }

        public class Branch
        {
            public Branch(int ID, string Name) { 
            this.BranchID = ID;
            this.Name = Name;
            }
            public int ID { get; set; }

            public int BranchID { get; set; }
            
            public string Name { get; set; }
        }

        public class RelationshipManager
        {
            public int ID { get; set; }
            public string Name { get; set; }
        }
    }
}