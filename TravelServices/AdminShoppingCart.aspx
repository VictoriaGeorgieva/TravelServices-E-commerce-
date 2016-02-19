<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
  CodeFile="AdminShoppingCart.aspx.cs" Inherits="AdminShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
    <div class="Header">
        <asp:HyperLink ID="HeaderLink" ImageUrl="~/Images/logo.png" NavigateUrl="~/" ToolTip="BalloonShop logo" Text="BalloonShop logo" runat="server" />
    </div>
  <span class="AdminTitle">
    Сайт за екскурзионни услуги в чужбина - Админ меню
    <br />
    Кошници
  </span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <p>
    <asp:Label ID="countLabel" runat="server">Здравей!
    </asp:Label></p>
  <p>
    <span>Колко дни?</span>
    <asp:DropDownList ID="daysList" runat="server">
      <asp:ListItem Value="0">Всички кошници</asp:ListItem>
      <asp:ListItem Value="1">Един</asp:ListItem>
      <asp:ListItem Value="10" Selected="True">Десет</asp:ListItem>
      <asp:ListItem Value="20">Двадесет</asp:ListItem>
      <asp:ListItem Value="30">Тридесет</asp:ListItem>
      <asp:ListItem Value="90">Деветдесет</asp:ListItem>
    </asp:DropDownList>
  </p>
  <p>
    <asp:Button ID="countButton" runat="server" Text="Преброй старите кошници" 
      onclick="countButton_Click" />
    <asp:Button ID="deleteButton" runat="server" Text="Изтрий старите кошници" OnClick="deleteButton_Click" />
  </p>
</asp:Content>
