using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LastTrialGene.Models
{
    [Serializable]
    public class ClientDetailsData
    {
        public string ID { get; set; }
        public int? CounterpartyType { get; set; }
        public string ClientNo { get; set; }
        public string Name { get; set; }
        public string Name2 { get; set; }
        public string Name3 { get; set; }
        public string LongName { get; set; }
        public int? SalutationType { get; set; }
        public int? IdentificationType { get; set; }
        public string IdentificationNo { get; set; }
        public string RegistrationOffice { get; set; }
        public string VATRegistrationNo { get; set; }
        public int? CustodialGroup { get; set; }
        //  public Dateofbirth DateOfBirth { get; set; }
        public DateTime DateOfBirth { get; set; }
        public int? TaxStatus { get; set; }
        public int? WithholdingTaxStatus { get; set; }
        public int? ResidentShareholdersTaxStatus { get; set; }
        public int? BranchID { get; set; }
        public int? Active { get; set; }
        //public Creationdate CreationDate { get; set; }
        public string CreationDate { get; set; }
        public object UserID { get; set; }
        public int? Corporate { get; set; }
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
        public string PhoneNo3 { get; set; }
        public string FaxNo { get; set; }
        public string EmailAddress { get; set; }
        public string CreditLimit { get; set; }
        public string DebitLimit { get; set; }
        public string SettlementLimit { get; set; }
        public string ActualCredit { get; set; }
        public string ActualDebit { get; set; }
        public string IndustryType { get; set; }
        public string PhysicalAddress3 { get; set; }
        public string PostalAddress3 { get; set; }
        public string InitialedName { get; set; }
        public object FileName { get; set; }
        //public Inceptiondate InceptionDate { get; set; }
        public DateTime InceptionDate { get; set; }
        public string SpecialInstructions { get; set; }
        public int? CustodialID { get; set; }
        public string EmailAddress2 { get; set; }
        public int? EmailStatement { get; set; }
        public int? HoldStatement { get; set; }
        public int? AgentID { get; set; }
        public string BankAccountName { get; set; }
        public string EmployerName { get; set; }
        public string EmployerPostalAddress { get; set; }
        public string EmployerPostalAddress2 { get; set; }
        public string EmployerPostalAddress3 { get; set; }
        public int? EmployerPostalCity { get; set; }
        public int? EmployerPostalCountry { get; set; }
        public string EmployerPhysicalAddress { get; set; }
        public string EmployerPhysicalAddress2 { get; set; }
        public string EmployerPhysicalAddress3 { get; set; }
        public int? EmployerPhysicalCity { get; set; }
        public int? EmployerPhysicalCountry { get; set; }
        public string EmployerPhoneNo { get; set; }
        public string EmployerPhoneNo2 { get; set; }
        public string EmployerFaxNo { get; set; }
        public int? Dimension { get; set; }
        public int? Dimension2 { get; set; }
        public int? Dimension3 { get; set; }
        public int? Dimension4 { get; set; }
        public int? Dimension5 { get; set; }
        public string Username { get; set; }
        public bool UpfrontFee { get; set; }
        public int? DividendWTax { get; set; }
        public int? DividendTaxStatus { get; set; }
        public object EmailAddress3 { get; set; }
        public object EmailAddress4 { get; set; }
        public int? BirthdayDiaryID { get; set; }
        public string IncomeTaxNo { get; set; }
        public int? ManagedClient { get; set; }
        public int? Authorised { get; set; }
        public object AuthorisedBy { get; set; }
        public object AuthorisedDate { get; set; }
        public int? AuthorisedActionID { get; set; }
        public int? Confirmed { get; set; }
        public int? Rejected { get; set; }
        public int? SexType { get; set; }
        public int? FundAdmin { get; set; }
        public int? IsFundAdmin { get; set; }
        public int? ClientGroup { get; set; }
        public int? Nationality { get; set; }
        public int? IncomeType { get; set; }
        public object IncomeType2 { get; set; }
        public int? Citizenship { get; set; }
        public int? Sector { get; set; }
        public string IncomeSource { get; set; }
        public int? ClientRisk { get; set; }
        public int? IsUSResident { get; set; }
        public int? HasUSGreenCard { get; set; }
        public string EstimatedAnnualSales { get; set; }
        public int? EstimatedTransPerMonth { get; set; }
        public int? AnticipatedTransPerMonth { get; set; }
        public string AnticipatedTotalAmount { get; set; }
        //public Expirydate ExpiryDate { get; set; }
        public string ExpiryDate { get; set; }

        public string GovRegNo { get; set; }
        public string RelationshipManager { get; set; }
        public int? Citizenship2 { get; set; }
        public int? SendSMS { get; set; }
        public string BPNumber { get; set; }
        public int? UseGlobalPortfolioModel { get; set; }
        public int? LedgerFee { get; set; }
        public int? CountryOfResidence { get; set; }
        public string VFXNumber { get; set; }
        public string ZSENumber { get; set; }
        public string BranchName { get; set; }
        public object IdentificationTypeName { get; set; }
        public string ClientTypeName { get; set; }
        public string CustodialGroupName { get; set; }
        public string PostalCityName { get; set; }
        public string PostalCountryName { get; set; }
        public string PhysicalCityName { get; set; }
        public string PhysicalCountryName { get; set; }
        public string EmployerPostalCityName { get; set; }
        public string EmployerPostalCountryName { get; set; }
        public string EmployerPhysicalCityName { get; set; }
        public string EmployerPhysicalCountryName { get; set; }
        public object DimensionName { get; set; }
        public string Dimension2Name { get; set; }
        public string Dimension3Name { get; set; }
        public string Dimension4Name { get; set; }
        public string Dimension5Name { get; set; }
        public int? Age { get; set; }
        public object AgentName { get; set; }
        public string ClientGroupName { get; set; }
        public string NationalityName { get; set; }
        public string RiskRatingName { get; set; }
        public string CitizenshipName { get; set; }
        public string Citizenship2Name { get; set; }



        //public ClientDetailsData Fill(int clientID)
        //{
        //    try
        //    {
        //        ClientDetailsPost clientDetailsPost = new ClientDetailsPost();
        //        clientDetailsPost.server = "OPTIMUSPRIME";
        //        clientDetailsPost.database = "GSAMUP";
        //        clientDetailsPost.user = "debugger";
        //        clientDetailsPost.password = "bug";
        //        clientDetailsPost.ID = clientID;

        //        var webClient = new WebClient();
        //        {
        //            var url = "http://localhost:93/gsam/api/client/view";

        //            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
        //            webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        //            webClient.Headers[HttpRequestHeader.Authorization] = "application/json";
        //            string data = JsonConvert.SerializeObject(clientDetailsPost);
        //            var response = webClient.UploadString(url, data);
        //            ClientDetailsReturn result = JsonConvert.DeserializeObject<ClientDetailsReturn>(response);
        //            return result.data;

        //        }
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public ClientDetailsData Update
        //    (int clientID,
        //    string Name,
        //    string Name2,
        //    string Name3,
        //    string ClientNo,
        //    bool Corporate,
        //    int SalutationType,
        //    DateTime DateOfBirth,
        //    int IndustryType,
        //    string RegistrationOffice,
        //    string VATRegistrationNo,
        //    string BPNumber,
        //    bool TaxStatus,
        //    bool WithholdingTaxStatus,
        //    bool ResidentShareholdersTaxStatus,
        //    int IdentificationType,
        //    string IdentificationNo,
        //    int AgentID,
        //    int CustodialID,
        //    int CounterpartyType,
        //    int CustodialGroup,
        //    DateTime InceptionDate,
        //    string SpecialInstructions,
        //    int BranchID,
        //    string PhysicalAddress,
        //    string PhysicalAddress2,
        //    string physicalAddress3,
        //    int PhysicalCity,
        //    int physicalCountry,
        //    string PostalAddress,
        //    string PostalAddress2,
        //    string PostalAddress3,
        //    int PostalCity,
        //    int PostalCountry,
        //    string PhoneNo,
        //    string PhoneNo2,
        //    string PhoneNo3,
        //    string FaxNo,
        //    string EmployerName,
        //    string EmployerPhysicalAddress,
        //    string EmployerPhysicalAddress2,
        //    string EmployerPhysicalAddress3,
        //    int EmployerPhysicalCity,
        //    int EmployerPhysicalCountry,
        //    string EmployerPostalAddress,
        //    string EmployerPostalAddress2,
        //    string EmployerPostalAddress3,
        //    int EmployerPostalCity,
        //    int EmployerPostalCountry,
        //    string EmployerPhoneNo,
        //    string EmployerPhoneNo2,
        //    string EmployerFaxNo,
        //    string EmailAddress,
        //    string EmailAddress2,
        //    bool EmailStatement,
        //    bool HoldStatement,
        //    string Dimension,
        //    string Dimension2,
        //    string Dimension3,
        //    string Dimension4,
        //    string Dimension5,
        //    decimal CreditLimit,
        //    decimal DebitLimit,
        //    decimal SettlementLimit,
        //    bool Active,
        //    bool ClientID,
        //    bool Update,
        //    bool delete,
        //    bool upfrontFee,
        //    string IncomeTaxNo,
        //    bool ManagedClient,
        //    bool LedgerFees,
        //    int FundAdmin,
        //    int ClientGroup,
        //    bool IsFundAdmin,
        //    int IncomeType,
        //    int Nationality,
        //    int Citizenship,
        //    int Citizenship2,
        //    bool HasUSGreenCard,
        //    bool IsUSResident,
        //    int DividendWTax,
        //    int Sector,
        //    int IncomeSource,
        //    int ClientRisk,
        //    decimal EstimatedAnnualSales,
        //    decimal EstimatedTransPerMonth,
        //    decimal AnticipatedTransPerMonth,
        //    decimal AnticipatedTotalAmount,
        //    DateTime ExpiryDate,
        //    string GovRegNo,
        //    int RelationshipManager,
        //    string GovBody,
        //    string UseGlobalPortfolioModel,
        //    int CountryOfResidence,
        //    bool SendSMS,
        //    string ZSENumber,
        //    string VFXNumber
        //    )

        //{

        //    ClientMDL editClient = new ClientMDL();

        //    editClient.Name = Name;
        //    editClient.Name2 = Name2;
        //    editClient.Name3 = Name3;
        //    editClient.ClientNo = ClientNo;
        //    editClient.Corporate = false;
        //    editClient.SalutationType = SalutationType;
        //    editClient.DateOfBirth = DateOfBirth.ToString();
        //    editClient.IndustryType = IndustryType;
        //    editClient.RegistrationOffice = RegistrationOffice;
        //    editClient.VATRegistrationNo = VATRegistrationNo;
        //    editClient.BPNumber = BPNumber;
        //    editClient.TaxStatus = TaxStatus;
        //    editClient.WithholdingTaxStatus = WithholdingTaxStatus;
        //    editClient.ResidentShareholdersTaxStatus = ResidentShareholdersTaxStatus;
        //    editClient.IdentificationType = IdentificationType;
        //    editClient.IdentificationNo = IdentificationNo;
        //    editClient.AgentID = 0;
        //    editClient.CustodialID = 0;
        //    editClient.CounterpartyType = CounterpartyType;
        //    editClient.CustodialGroup = CustodialGroup;
        //    editClient.InceptionDate = DateTime.Now.ToString("yyyy-MM-dd");
        //    editClient.SpecialInstructions = SpecialInstructions;
        //    editClient.BranchID = BranchID;
        //    editClient.PhysicalAddress = PhysicalAddress;
        //    editClient.PhysicalAddress2 = PhysicalAddress2;
        //    editClient.PhysicalAddress3 = physicalAddress3;
        //    editClient.PhysicalCity = PhysicalCity;
        //    editClient.PhysicalCountry = physicalCountry;
        //    editClient.PostalAddress = PostalAddress;
        //    editClient.PostalAddress2 = PostalAddress2;
        //    editClient.PostalAddress3 = PostalAddress3;
        //    editClient.PostalCity = PostalCity;
        //    editClient.PostalCountry = PostalCountry; ;
        //    editClient.PhoneNo = PhoneNo;
        //    editClient.PhoneNo2 = PhoneNo2;
        //    editClient.PhoneNo3 = PhoneNo3;
        //    editClient.FaxNo = FaxNo;
        //    editClient.EmployerName = EmployerName;
        //    editClient.EmployerPhysicalAddress = EmployerPhysicalAddress;
        //    editClient.EmployerPhysicalAddress2 = EmployerPhysicalAddress2;
        //    editClient.EmployerPhysicalAddress3 = EmployerPhysicalAddress3;
        //    editClient.EmployerPhysicalCity = 1;
        //    editClient.EmployerPhysicalCountry = 1;
        //    editClient.EmployerPostalAddress = EmployerPostalAddress;
        //    editClient.EmployerPostalAddress2 = EmployerPostalAddress2;
        //    editClient.EmployerPostalAddress3 = EmployerPostalAddress3;
        //    editClient.EmployerPostalCity = 1;
        //    editClient.EmployerPostalCountry = 1;
        //    editClient.EmployerPhoneNo = EmployerPhoneNo;
        //    editClient.EmployerPhoneNo2 = EmployerPhoneNo2;
        //    editClient.EmployerFaxNo = EmployerFaxNo;
        //    editClient.EmailAddress = EmailAddress;
        //    editClient.EmailAddress2 = EmailAddress2;
        //    editClient.EmailStatement = true;
        //    editClient.HoldStatement = false;
        //    editClient.Dimension = Dimension;
        //    editClient.Dimension2 = Dimension2;
        //    editClient.Dimension3 = Dimension3;
        //    editClient.Dimension4 = Dimension4;
        //    editClient.Dimension5 = Dimension5;
        //    editClient.CreditLimit = 0;
        //    editClient.DebitLimit = 0;
        //    editClient.SettlementLimit = 0;
        //    editClient.Active = Active;
        //    editClient.ClientID = true;
        //    editClient.Update = 1;
        //    editClient.Delete = 0;
        //    editClient.UpfrontFee = UpfrontFee;
        //    editClient.IncomeTaxNo = IncomeTaxNo;
        //    editClient.ManagedClient = ManagedClient;
        //    editClient.LedgerFee = true;
        //    editClient.FundAdmin = 0;
        //    editClient.ClientGroup = ClientGroup;
        //    editClient.IsFundAdmin = true;
        //    editClient.IncomeType = IncomeType;
        //    editClient.Nationality = Nationality;
        //    editClient.Citizenship = Citizenship;
        //    editClient.Citizenship2 = Citizenship2;
        //    editClient.HasUSGreenCard = HasUSGreenCard;
        //    editClient.IsUSResident = IsUSResident;
        //    editClient.DividendWTax = 0;
        //    editClient.Sector = Sector;
        //    editClient.IncomeSource = IncomeSource;
        //    editClient.ClientRisk = ClientRisk;
        //    editClient.EstimatedAnnualSales = 0;
        //    editClient.EstimatedTransPerMonth = 0;
        //    editClient.AnticipatedTransPerMonth = 0;
        //    editClient.AnticipatedTotalAmount = 0;
        //    editClient.ExpiryDate = ExpiryDate.ToString();
        //    editClient.GovRegNo = "";
        //    editClient.RelationshipManager = 0;
        //    editClient.GovBody = "";
        //    editClient.UseGlobalPortfolioModel = UseGlobalPortfolioModel;
        //    editClient.CountryOfResidence = CountryOfResidence;
        //    editClient.SendSMS = SendSMS;
        //    editClient.VFXNumber = VFXNumber;
        //    editClient.ZSENumber = ZSENumber;
        //    //editClient.SexType = (cboGender.Value == null ? 0 : (int)cboGender.Value);



        //    try
        //    {

        //        var webClient = new WebClient();
        //        {
        //            //webClient.BaseAddress = "http://localhost:93/gsam";
        //            var url = "http://localhost:93/gsam/api/client/create_update";

        //            webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
        //            webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        //            string data = JsonConvert.SerializeObject(editClient);
        //            var response = webClient.UploadString(url, data);
        //            var result = JsonConvert.DeserializeObject<ClientDetailsReturn>(response);
        //            return result.data;

        //            //Session["SelectedClientID"] = result.data.ClientID;
        //            //Response.Redirect("aaac.aspx");
        //        }
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }

    public class ClientDetailsMDL
    {
        public string server { get; set; } = "OPTIMUSPRIME";
        public string user { get; set; } = "debugger";
        public string password { get; set; } = "bug";
        public string database { get; set; } = "GSAMUP";
        public int ID { get; set; }

        public class ClientDetailsReturn
        {
            public string status { get; set; }
            public string message { get; set; }
            public ClientDetailsData data { get; set; }
        }

        public class ClientDetailsDataUpdate
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
            public string DateOfBirth { get; set; }
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
            public string InceptionDate { get; set; }
            public string SpecialInstructions { get; set; }
            public int BranchID { get; set; }
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
            public bool ClientID { get; set; }
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


    public class Dateofbirth
    {
        public string date { get; set; }
        public int? timezone_type { get; set; }
        public string timezone { get; set; }
    }

    public class Creationdate
    {
        public string date { get; set; }
        public int? timezone_type { get; set; }
        public string timezone { get; set; }
    }

    public class Inceptiondate
    {
        public DateTime date { get; set; }
        public int? timezone_type { get; set; }
        public string timezone { get; set; }
    }

    public class Expirydate
    {
        public string date { get; set; }
        public int? timezone_type { get; set; }
        public string timezone { get; set; }
    }

    public class ClientDetailsPost
    {
        public string server { get; set; }
        public string database { get; set; }
        public string user { get; set; }
        public string password { get; set; }
        public int ID { get; set; }
    }

    public class Inception {
        public DateTime date{ get; set; }
    }
    public class DateofBirth
    {
        public DateTime date { get; set; }
    }
    public class ClientDetailsDataUpdate1
    {
        public string server { get; set; } = "OPTIMUSPRIME";
        public string user { get; set; } = "debugger";
        public string password { get; set; } = "bug";
        public string database { get; set; } = "GSAMUP";

        //public Post Post { get; set; }


       public int? ID { get; set; }
        public string ClientNo { get; set; }

        public string AutoGene { get; set; }

        
            public string EntityType { get; set; }
        public string Name { get; set; }
        public string Name2 { get; set; }
        public string Name3 { get; set; }
        public bool Corporate { get; set; }
        public int SalutationType { get; set; }
        public DateTime DateOfBirth { get; set; }// = new DateofBirth().date != null ? new DateofBirth().date.ToString() : DateTime.Now.ToString();
        public int SexType { get; set; }
        public int IndustryType { get; set; }
        public string RegistrationOffice { get; set; }
        public string VATRegistrationNo { get; set; }
        public string BPNumber { get; set; }
        public DateofBirth DateofBirth { get; set; }

        /// <summary>
        /// /////////////////////Custom Begins Here////////////////////////////////////////////////////////
        /// </summary>
        public string contactEmail2 { get; set; }
        public string VAT { get; set; }

        
        public string empdate { get; set; } //= new DateofBirth().date!=null? new DateofBirth().date.ToString():DateTime.Now.ToString();
        public string empdate2 { get; set; } //= new DateofBirth().date != null ? new DateofBirth().date.ToString() : DateTime.Now.ToString();
        /// <summary>
        /// ///////////////////////////////////Custom Ends Here//////////////////////////////////////////
        /// </summary>


        public int IdentificationType { get; set; }
        public string IdentificationNo { get; set; }
        public int AgentID { get; set; }
        public int CustodialID { get; set; }
        public int CounterpartyType { get; set; }
        public int CustodialGroup { get; set; }
        public DateTime InceptionDate { get; set; }// = DateTime.Now.ToString();//new Inceptiondate().date!=null ? new Inceptiondate().date:DateTime.Now;//


        public string SpecialInstructions { get; set; }
        public int BranchID { get; set; }
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
        public string EmailAddress3 { get; set; }
        public string EmailAddress4 { get; set; }

        public string EmployerPhysicalAddress { get; set; }
        
       public string EmployerName { get; set; }

  
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

        public string Dimension { get; set; }
        public string Dimension2 { get; set; }
        public string Dimension3 { get; set; }
        public string Dimension4 { get; set; }
        public string Dimension5 { get; set; }
        public double CreditLimit { get; set; }
        public double DebitLimit { get; set; }
        public double SettlementLimit { get; set; }
        /// <summary>
        /// /////////////////Bools Begin here//////////////
        /// </summary>
        public int Active { get; set; }
        public int ClientID { get; set; }
        public int LedgerFee { get; set; }
        public bool Update { get; set; }
        public bool Delete { get; set; }
        public int TaxStatus { get; set; }
        public int WithholdingTaxStatus { get; set; }
        public int IsFundAdmin { get; set; }
        public int ManagedClient { get; set; }
        public bool UpfrontFee { get; set; }

        public int IsUSResident { get; set; }
        public int HasUSGreenCard { get; set; }
        public int SendSMS { get; set; }

        public int EmailStatement { get; set; }
        public int HoldStatement { get; set; }

        public int DualCit { get; set; }
        /// <summary>
        /// /////////////////Bools Ends here//////////////
        /// </summary>
        /// 
        
        public int USResident { get; set; }

        public string IncomeTaxNo { get; set; }
         
        public int FundAdmin { get; set; }
        public int ClientGroup { get; set; }
        
        public int IncomeType { get; set; }
        public int Nationality { get; set; }
        
            public int nationality { get; set; }
        public int DividendWTax { get; set; }
        public int Citizenship { get; set; }
        public int Sector { get; set; }
        public int IncomeSource { get; set; }
        public int ClientRisk { get; set; }

        public decimal EstimatedAnnualSales { get; set; }
        public int EstimatedTransPerMonth { get; set; }
        public int AnticipatedTransPerMonth { get; set; }
        public decimal AnticipatedTotalAmount { get; set; }
        public string ExpiryDate { get; set; } = new Expirydate().date!=null ? new Expirydate().date.ToString():DateTime.Now.ToString();
        public string CreationDate { get; set; } = new CreationDate().date != null ? new CreationDate().date.ToString() : DateTime.Now.ToString();

        public string GovRegNo { get; set; }
        public int RelationshipManager { get; set; }
        public int Citizenship2 { get; set; }
        public string GovBody { get; set; }
        public string UseGlobalPortfolioModel { get; set; }
        public int CountryOfResidence { get; set; }
        public string TMONAcc { get; set; }
        public string VFXNumber { get; set; }
        public string ZSENumber { get; set; }
      
    }
}