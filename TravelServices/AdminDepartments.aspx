﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
  CodeFile="AdminDepartments.aspx.cs" Inherits="AdminDepartments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
    <div class="Header">
        <asp:HyperLink ID="HeaderLink" ImageUrl="~/Images/logo.png" NavigateUrl="~/" ToolTip="BalloonShop logo" Text="BalloonShop logo" runat="server" />
    </div>
  <span class="AdminTitle">
    Сайт за екскурзионни услуги в чужбина - Админ меню
    <br />
    Отдели
  </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="DepartmentID" Width="100%" 
    AutoGenerateColumns="False" onrowcancelingedit="grid_RowCancelingEdit" 
    onrowdeleting="grid_RowDeleting" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating">
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Име на отдел" 
        SortExpression="Name" />
      <asp:TemplateField HeaderText="Описасние на отдел" 
        SortExpression="Description">
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' Height="70px" TextMode="MultiLine" 
            Width="400px"></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:HyperLinkField DataNavigateUrlFields="DepartmentID" 
        DataNavigateUrlFormatString="AdminCategories.aspx?DepartmentID={0}" 
        HeaderText="Виж категории" Text="Разгледай категории" />
      <asp:CommandField ShowEditButton="True" EditText="Редактирай" CancelText="Откажи" UpdateText="Обнови"/>
      <asp:ButtonField CommandName="Delete" Text="Изтрий" />
    </Columns>
  </asp:GridView>
  <p>Създай нов отдел:</p>
  <p>Име:</p>
  <asp:TextBox ID="newName" runat="server" Width="400px" />
  <p>Описание:</p>
  <asp:TextBox ID="newDescription" runat="server" Width="400px" Height="70px" TextMode="MultiLine" />
  <p><asp:Button ID="createDepartment" Text="Създай отдел" runat="server" 
      onclick="createDepartment_Click" /></p>
</asp:Content>
