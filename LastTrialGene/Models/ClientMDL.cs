using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LastTrialGene.Models
{
    public class ClientMDL
    {
        public string server { get; set; } = "OPTIMUSPRIME";
        public string user { get; set; } = "debugger";
        public string password { get; set; } = "bug";
        public string database { get; set; } = "GSAMUP";

        //public Post Post { get; set; }


        //public int? ID { get; set; }
        public string ClientNo { get; set; }
        public string Name { get; set; }
        public string Name2 { get; set; }
        public string Name3 { get; set; }
        public bool Corporate { get; set; }
        public int SalutationType { get; set; }
        public DateTime DateOfBirth { get; set; }
        public int SexType { get; set; }
        public int IndustryType { get; set; }
        public string RegistrationOffice { get; set; }
        public string VATRegistrationNo { get; set; }
        public string BPNumber { get; set; }
        public bool TaxStatus { get; set; }
        public bool WithholdingTaxStatus { get; set; }
        public bool ResidentShareholdersTaxStatus { get; set; }
        public int IdentificationType { get; set; }
        public string IdentificationNo { get; set; }
        public int AgentID { get; set; }
        public int CustodialID { get; set; }
        public int CounterpartyType { get; set; }
        public int CustodialGroup { get; set; }
        public DateTime InceptionDate { get; set; }
        public string SpecialInstructions { get; set; }
        public string BranchID { get; set; }
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
        public string PhoneNo3 { get; set; }
        public string FaxNo { get; set; }
        public string EmployerName { get; set; }
        public string EmployerPhysicalAddress { get; set; }
        public string EmployerPhysicalAddress2 { get; set; }
        public string EmployerPhysicalAddress3 { get; set; }
        public int EmployerPhysicalCity { get; set; }
        public int EmployerPhysicalCountry { get; set; }
        public string EmployerPostalAddress { get; set; }
        public string EmployerPostalAddress2 { get; set; }
        public string EmployerPostalAddress3 { get; set; }
        public int EmployerPostalCity { get; set; }
        public int EmployerPostalCountry { get; set; }
        public string EmployerPhoneNo { get; set; }
        public string EmployerPhoneNo2 { get; set; }
        public string EmployerFaxNo { get; set; }
        public string EmailAddress { get; set; }
        public string EmailAddress2 { get; set; }
        public bool EmailStatement { get; set; }
        public bool HoldStatement { get; set; }
        public string Dimension { get; set; }
        public string Dimension2 { get; set; }
        public string Dimension3 { get; set; }
        public string Dimension4 { get; set; }
        public string Dimension5 { get; set; }
        public double CreditLimit { get; set; }
        public double DebitLimit { get; set; }
        public double SettlementLimit { get; set; }
        public bool Active { get; set; }
        public object ClientID { get; set; }
        public bool LedgerFee { get; set; }
        public int Update { get; set; }
        public int Delete { get; set; }
        public bool UpfrontFee { get; set; }
        public string IncomeTaxNo { get; set; }
        public bool ManagedClient { get; set; }
        public int FundAdmin { get; set; }
        public int ClientGroup { get; set; }
        public bool IsFundAdmin { get; set; }
        public int IncomeType { get; set; }
        public int Nationality { get; set; }
        public int DividendWTax { get; set; }
        public int Citizenship { get; set; }
        public int Sector { get; set; }
        public int IncomeSource { get; set; }
        public int ClientRisk { get; set; }
        public bool IsUSResident { get; set; }
        public bool HasUSGreenCard { get; set; }
        public decimal EstimatedAnnualSales { get; set; }
        public decimal EstimatedTransPerMonth { get; set; }
        public decimal AnticipatedTransPerMonth { get; set; }
        public decimal AnticipatedTotalAmount { get; set; }
        public string ExpiryDate { get; set; }
        public string GovRegNo { get; set; }
        public int RelationshipManager { get; set; }
        public int Citizenship2 { get; set; }
        public string GovBody { get; set; }
        public string UseGlobalPortfolioModel { get; set; }
        public int CountryOfResidence { get; set; }
        public string VFXNumber { get; set; }
        public string ZSENumber { get; set; }
        public bool SendSMS { get; set; }
    }
}