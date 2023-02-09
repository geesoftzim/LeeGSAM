using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace LastTrialGene.Models
{
    public class ContactsMDL
    {
        public string server { get; set; } = "OPTIMUSPRIME";
        public string user { get; set; } = "debugger";
        public string password { get; set; } = "bug";
        public string database { get; set; } = "GSAMUP";

        public int ClientID { get; set; }
        public int ContactType { get; set; }
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
        public int Citizenship2 { get; set; }
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
        public int? CounterpartyID { get; set; }
        public int? MMCounterpartyID { get; set; }
        public int? ContactType { get; set; }
        public string Name { get; set; }
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
        public CreationDate CreationDate { get; set; }
        public int? StockBrokerID { get; set; }
        public int? CustodianID { get; set; }
        public int? TransferSecretaryID { get; set; }
        public int? IdentificationType { get; set; }
        public string IdentificationNo { get; set; }
        public int? Nationality { get; set; }
        public int? IsUSResident { get; set; }
        public int? HasUSGreenCard { get; set; }
        public string OwnershipPercent { get; set; }
        public int? Citizenship { get; set; }
        public int? Citizenship2 { get; set; }
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


        public List<ContactList> Fill(int clientID)
        {
            try
            {
                ContactListPost accall = new ContactListPost();
                accall.server = "OPTIMUSPRIME";
                accall.database = "GSAMUP";
                accall.user = "debugger";
                accall.password = "bug";
                accall.ClientID = clientID;

                var webClient = new WebClient();
                {
                    var url = "http://localhost:93/gsam/api/client/contact_list";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(accall);
                    var response = webClient.UploadString(url, data);
                    ContactListReturn result = JsonConvert.DeserializeObject<ContactListReturn>(response);
                    return result.data;

                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}