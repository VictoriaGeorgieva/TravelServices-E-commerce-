<%@ Page Title="" Language="C#" MasterPageFile="~/BalloonShop.master" AutoEventWireup="true"
  CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<%@ Register TagPrefix="uc1" TagName="CustomerDetailsEdit" 
Src="UserControls/CustomerDetailsEdit.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:Label ID="titleLabel" runat="server" 
    CssClass="CatalogTitle" Text="Потвърдете вашата поръчка" />
  <br /><br />
  <asp:GridView ID="grid" runat="server" Width="100%"
    AutoGenerateColumns="False" DataKeyNames="ProductID" 
    BorderWidth="1px" >
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Име на продукта"
       ReadOnly="True" SortExpression="Name" />
      <asp:BoundField DataField="FromDate" HeaderText="Начална дата" ReadOnly="True" />
      <asp:BoundField DataField="ToDate" HeaderText="Крайна дата" ReadOnly="True" />
      <asp:BoundField DataField="Price" DataFormatString="{0:N2}"
       HeaderText="Цена" ReadOnly="True"
        SortExpression="Price" />
      <asp:BoundField DataField="Quantity" HeaderText="Количество"
       ReadOnly="True" SortExpression="Quantity" />
      <asp:BoundField DataField="Subtotal" ReadOnly="True" 
        DataFormatString="{0:N2}" HeaderText="Междинна цена"
        SortExpression="Subtotal" />
    </Columns>
  </asp:GridView>
  <asp:Label ID="Label2" runat="server" Text="Обща стойност: " 
    CssClass="ProductDescription" />
  <asp:Label ID="totalAmountLabel" runat="server" Text="Label" 
    CssClass="ProductPrice" />
  <br /><br />
  <uc1:CustomerDetailsEdit ID="CustomerDetailsEdit1" 
    runat="server" Editable="false" Title="Детайли на потребителя" />
  <br />
  <asp:Label ID="InfoLabel" runat="server" />
  <br /><br />
  <asp:Label ID="Label1" runat="server" />
  <br /><br />
  Тип на доставката:
  <asp:DropDownList ID="shippingSelection" runat="server" />
  <br /><br />
  <asp:Button ID="placeOrderButton" runat="server"
    Text="Направете поръчката" OnClick="placeOrderButton_Click" />
</asp:Content>
