﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
  CodeFile="AdminOrderDetails.aspx.cs" Inherits="AdminOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
    <div class="Header">
        <asp:HyperLink ID="HeaderLink" ImageUrl="~/Images/logo.png" NavigateUrl="~/" ToolTip="BalloonShop logo" Text="BalloonShop logo" runat="server" />
    </div>
  <span class="AdminTitle">Сайт за екскурзионни услуги в чужбина - Админ меню
    <br />
    Детайли на поръчка </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <h2>
    <asp:Label ID="orderIdLabel" runat="server" CssClass="AdminTitle" 
    Text="Поръчка #000" />
  </h2>
  <span class="WideLabel">Обща стойност:</span>
  <asp:Label ID="totalAmountLabel" runat="server" />
  <br />
  <span class="WideLabel">Дата на създаване:</span>
  <asp:TextBox ID="dateCreatedTextBox" runat="server" Width="400px" 
    enabled="false" />
  <br />
  <span class="WideLabel">Дата на изпращане:</span>
  <asp:TextBox ID="dateShippedTextBox" runat="server" Width="400px" />
  <br />
  <span class="WideLabel">Статус:</span>
  <asp:DropDownList ID="statusDropDown" runat="server" />
  <br />
  <span class="WideLabel">Код за разрешение:</span>
  <asp:TextBox ID="authCodeTextBox" runat="server" Width="400px" />
  <br />  
  <span class="WideLabel">Номер на поръчката:</span>
  <asp:TextBox ID="referenceTextBox" runat="server" Width="400px" />
  <br />
  <span class="WideLabel">Коментари:</span>
  <asp:TextBox ID="commentsTextBox" runat="server" Width="400px" />
  <br />
  <span class="WideLabel">Име на клиента:</span>
  <asp:TextBox ID="customerNameTextBox" runat="server" Width="400px" 
    enabled="false"  />
  <br />
  <span class="WideLabel">Адрес за доставка:</span>
  <asp:TextBox ID="shippingAddressTextBox" runat="server" Width="400px" 
    Height="200px" TextMode="MultiLine" enabled="false"  />
  <br />
  <span class="WideLabel">Тип на доставка:</span>
  <asp:TextBox ID="shippingTypeTextBox" runat="server" Width="400px" 
    enabled="false" />
  <br />
  <span class="WideLabel">Ел. поща на клиента:</span>
  <asp:TextBox ID="customerEmailTextBox" runat="server" Width="400px" 
    enabled="false" />
  <br />
  
  <asp:Button ID="editButton" runat="server" 
    Text="Редактирай" Width="100px" OnClick="editButton_Click" />
  <asp:Button ID="updateButton" runat="server"
    Text="Обнови" Width="100px" OnClick="updateButton_Click" />
  <asp:Button ID="cancelButton" runat="server"
    Text="Откажи" Width="100px" OnClick="cancelButton_Click" />
  <br />
  <asp:Button ID="processOrderButton" runat="server"
    Text="Изпълнение на поръчката" Width="310px" 
    OnClick="processOrderButton_Click" />
  <br />
  <asp:Button ID="cancelOrderButton" runat="server"
    Text="Откажи поръчката" Width="310px" 
    OnClick="cancelOrderButton_Click" />
    
  <p>
    Поръчката съдържа следните продукти:
  </p>
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" BackColor="White" Width="100%">
    <Columns>
      <asp:BoundField DataField="ProductID" HeaderText="Идентификатор на продукт" ReadOnly="True" SortExpression="ProductID" />
      <asp:BoundField DataField="ProductName" HeaderText="Име на продукт" ReadOnly="True" SortExpression="ProductName" />
      <asp:BoundField DataField="Quantity" HeaderText="Количество" ReadOnly="True" SortExpression="Quantity" />
      <asp:BoundField DataField="UnitCost" HeaderText="Единична цена" ReadOnly="True" SortExpression="UnitCost" />
      <asp:BoundField DataField="Subtotal" HeaderText="Междинна цена" ReadOnly="True" SortExpression="Subtotal" />
    </Columns>
  </asp:GridView>
  
  <p>Одит път на поръчката:</p>
  <asp:GridView ID="auditGrid" runat="server"
  AutoGenerateColumns="False" BackColor="White"
  BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
  CellPadding="3" GridLines="Horizontal" Width="100%">
  <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
  <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
  <Columns>
    <asp:BoundField DataField="AuditID" HeaderText="Идентификатор на одит"
      ReadOnly="True" SortExpression="AuditID" />
    <asp:BoundField DataField="DateStamp" HeaderText="Дата"
      ReadOnly="True" SortExpression="DateStamp" />
    <asp:BoundField DataField="MessageNumber"
      HeaderText="Номер на съобщението" ReadOnly="True"
      SortExpression="MessageNumber" />
    <asp:BoundField DataField="Message" HeaderText="Съобщение"
      ReadOnly="True" SortExpression="Message" />
  </Columns>
  <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C"
    HorizontalAlign="Right" />
  <SelectedRowStyle BackColor="#738A9C" Font-Bold="True"
    ForeColor="#F7F7F7" />
  <HeaderStyle BackColor="#4A3C8C" Font-Bold="True"
    ForeColor="#F7F7F7" />
  <AlternatingRowStyle BackColor="#F7F7F7" />
</asp:GridView>

  
</asp:Content>
