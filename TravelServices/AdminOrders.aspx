<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
  CodeFile="AdminOrders.aspx.cs" Inherits="AdminOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
    <div class="Header">
        <asp:HyperLink ID="HeaderLink" ImageUrl="~/Images/logo.png" NavigateUrl="~/" ToolTip="BalloonShop logo" Text="BalloonShop logo" runat="server" />
    </div>
  <span class="AdminTitle">Сайт за екскурзионни услуги в чужбина - Админ меню
    <br />
    Поръчки </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  Покажи поръчки, групирани по клиенти
  <asp:DropDownList ID="userDropDown" runat="server" DataSourceID="CustomerNameDS"
    DataTextField="UserName" DataValueField="UserId" />
  <asp:Button ID="byCustomerGo" runat="server" Text="Покажи" OnClick="byCustomerGo_Click" />
  <br />
  Покажи поръчки, групирани по уникалния идентификатор
  <asp:TextBox ID="orderIDBox" runat="server" Width="77px" />
  <asp:Button ID="byIDGo" runat="server" Text="Покажи" OnClick="byIDGo_Click" />
  <br />
  Покажи най-новите
  <asp:TextBox ID="recentCountTextBox" runat="server" MaxLength="4" Width="40px">20</asp:TextBox>
  поръчки
  <asp:Button ID="byRecentGo" runat="server" Text="Покажи" OnClick="byRecentGo_Click" />
  <br />
  Покажи всички поръчки създадени между
  <asp:TextBox ID="startDateTextBox" runat="server" Width="72px" />
  и
  <asp:TextBox ID="endDateTextBox" runat="server" Width="72px" />
  <asp:Button ID="byDateGo" runat="server" Text="Покажи" OnClick="byDateGo_Click" />
  <br />
  Покажи поръчки, чакащи проверка на наличностите
  <asp:Button ID="awaitingStockGo" runat="server" Text="Покажи" OnClick="awaitingStockGo_Click" />
  <br />
  Покажи поръчки, чакащи изпращане.
  <asp:Button ID="awaitingShippingGo" runat="server" Text="Покажи" OnClick="awaitingShippingGo_Click" />
  <br />
  <br />
  <asp:Label ID="errorLabel" runat="server" CssClass="AdminError" EnableViewState="False"></asp:Label>
  &nbsp;<asp:RangeValidator ID="startDateValidator" runat="server" ControlToValidate="startDateTextBox"
    Display="None" ErrorMessage="Невалидна начална дата" MaximumValue="1/1/2015" MinimumValue="1/1/2009"
    Type="Date"></asp:RangeValidator>
  &nbsp;<asp:RangeValidator ID="endDateValidator" runat="server" ControlToValidate="endDateTextBox"
    Display="None" ErrorMessage="Невалидна крайна дата" MaximumValue="1/1/2015" MinimumValue="1/1/1999"
    Type="Date"></asp:RangeValidator>
  &nbsp;<asp:CompareValidator ID="compareDatesValidator" runat="server" ControlToCompare="endDateTextBox"
    ControlToValidate="startDateTextBox" Display="None" ErrorMessage="Началната дата трябва да бъде по-ранна от крайната."
    Operator="LessThan" Type="Date"></asp:CompareValidator>
  <asp:ValidationSummary ID="validationSummary" runat="server" CssClass="AdminError"
    HeaderText="Грешки при валидация на данните:" />
  <br />
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID"
    OnSelectedIndexChanged="grid_SelectedIndexChanged">
    <Columns>
      <asp:BoundField DataField="OrderID" HeaderText="Идентификатор на поръчка" ReadOnly="True" SortExpression="OrderID" />
      <asp:BoundField DataField="DateCreated" HeaderText="Дата на създаване" ReadOnly="True"
        SortExpression="DateCreated" />
      <asp:BoundField DataField="DateShipped" HeaderText="Дата на изпращане" ReadOnly="True"
        SortExpression="DateShipped" />
      <asp:BoundField DataField="StatusAsString" HeaderText="Статус" ReadOnly="True" SortExpression="StatusAsString" />
      <asp:BoundField DataField="CustomerName" HeaderText="Име на клиента" ReadOnly="True"
        SortExpression="CustomerName" />
      <asp:ButtonField CommandName="Select" Text="Избери" />
    </Columns>
  </asp:GridView>
  <asp:SqlDataSource ID="CustomerNameDS" runat="server" ConnectionString="<%$ ConnectionStrings:BalloonShopConnection %>"
    SelectCommand="SELECT vw_aspnet_Users.UserName,
      vw_aspnet_Users.UserId FROM vw_aspnet_Users INNER JOIN
      aspnet_UsersInRoles ON vw_aspnet_Users.UserId =
      aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON
      aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE
      (aspnet_Roles.RoleName = 'Customers')" />
</asp:Content>
