<%@ Page Title="" Language="C#" MasterPageFile="~/BalloonShop.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:LoginView ID="LoginView1" runat="server">
    <LoggedInTemplate>
      Вече сте регистриран.
    </LoggedInTemplate>
  </asp:LoginView>
  <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F6F3" 
    BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" 
    CancelDestinationPageUrl="~/" ContinueDestinationPageUrl="CustomerDetails.aspx" 
    CreateUserButtonText="Регистрирай ме" Font-Names="Verdana" Font-Size="0.8em" 
    oncreateduser="CreateUserWizard1_CreatedUser" ConfirmPasswordCompareErrorMessage="Паролата трябва да съвпада" 
    DuplicateUserNameErrorMessage="Потребителското име вече съществува" InvalidPasswordErrorMessage="Въведената парола трябва да е над 7 символа и да съдържа поне един специален символ"
    UserNameLabelText="Потребителско име" PasswordLabelText="Парола" CompleteSuccessText="Вашият профил беше създаден успешно" ContinueButtonText="Продължи"
    ConfirmPasswordLabelText="Потвърди парола" EmailLabelText="Ел.поща" QuestionLabelText="Таен въпрос" AnswerLabelText="Таен отговор">
    <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" 
      VerticalAlign="Top" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
    <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
      BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
      ForeColor="#284775" />
    <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
      BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
      ForeColor="#284775" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
      Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
    <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
      BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
      ForeColor="#284775" />
    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
    <StepStyle BorderWidth="0px" />
    <WizardSteps>
      <asp:CreateUserWizardStep Title="Създаване на профил" runat="server" />
      <asp:CompleteWizardStep runat="server" />
    </WizardSteps>
  </asp:CreateUserWizard>
</asp:Content>

