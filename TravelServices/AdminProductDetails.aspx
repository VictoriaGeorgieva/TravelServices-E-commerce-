<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminProductDetails.aspx.cs" Inherits="AdminProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
    <div class="Header">
        <asp:HyperLink ID="HeaderLink" ImageUrl="~/Images/logo.png" NavigateUrl="~/" ToolTip="BalloonShop logo" Text="BalloonShop logo" runat="server" />
    </div>
  <span class="AdminTitle">
    Сайт за екскурзионни услуги в чужбина - Админ меню
    <br />
    Продукти в 
    <asp:HyperLink ID="catLink" runat="server" />
  </span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <asp:Label CssClass="AdminTitle" ID="productNameLabel" runat="server" />  
  <p>
    <asp:Label ID="statusLabel" CssClass="AdminError" runat="server" />
  </p>
  <p>
    Продуктът принадлежи на тези категории:
    <asp:Label ID="categoriesLabel" runat="server" />
  </p>
  <p>
    Премахни продукта от тази категория:
    <asp:DropDownList ID="categoriesListRemove" runat="server" />  
    <asp:Button ID="removeButton" runat="server" Text="Премахни" OnClick="removeButton_Click" />
    <asp:Button ID="deleteButton" runat="server" Text="Изтрий от каталог" OnClick="deleteButton_Click" />
  </p>
  <p>
    Добави продукта към тази категория:
    <asp:DropDownList ID="categoriesListAssign" runat="server" />  
    <asp:Button ID="assignButton" runat="server" Text="Добави" OnClick="assignButton_Click" />
  <p>
    Премести продукта към тази категория:
    <asp:DropDownList ID="categoriesListMove" runat="server" />
    <asp:Button ID="moveButton" runat="server" Text="Премести" OnClick="moveButton_Click" />
  </p>
  <p>
    Име на снимка 1:
    <asp:Label ID="Image1Label" runat="server" />
    <asp:FileUpload ID="image1FileUpload" runat="server" />
    <asp:Button ID="upload1Button" runat="server" Text="Добави" 
      onclick="upload1Button_Click" /><br />
    <asp:Image ID="image1" runat="server" />
  </p>
  <p>
    Име на снимка 2:
    <asp:Label ID="Image2Label" runat="server" />
    <asp:FileUpload ID="image2FileUpload" runat="server" />
    <asp:Button ID="upload2Button" runat="server" Text="Добави" 
      onclick="upload2Button_Click" /><br />
    <asp:Image ID="image2" runat="server" />
  </p>
</asp:Content>