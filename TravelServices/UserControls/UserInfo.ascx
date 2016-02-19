<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInfo.ascx.cs" Inherits="UserControls_UserInfo" %>
<table cellspacing="0" border="0" width="200px" >
  <asp:LoginView ID="LoginView1" runat="server">
    <AnonymousTemplate>
      <tr>
        <td class="UserInfoHead">Добре дошли!</td>
      </tr>    
      <tr>
        <td class="UserInfoContent">
          Вие не сте влязъл в сайта.
          <br />
          <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText ="Вход" />
          или
          <asp:HyperLink runat="server" ID="registerLink"
            NavigateUrl="~/Register.aspx" Text="Регистрация"
            ToolTip="Отиди в страницата за регистрация."/>
        </td>
      </tr>
    </AnonymousTemplate>
    <RoleGroups>
      <asp:RoleGroup Roles="Administrators">      
        <ContentTemplate>
          <tr>
            <td class="UserInfoHead">
              <asp:LoginName ID="LoginName2" runat="server" FormatString="Здравей, <b>{0}</b>!" />
            </td>
          </tr>            
          <tr>
            <td class="UserInfoContent">              
              <asp:LoginStatus ID="LoginStatus2" runat="server" LogoutText="Изход" LoginText="Вход" />
              <br />
              <a href="./">Начало</a>   
              <br />
              <a href="AdminDepartments.aspx">Каталог-администратор</a>
              <br />
              <a href="AdminShoppingCart.aspx">Кошници-администратор</a>
              <br />
              <a href="AdminOrders.aspx">Поръчки-администратор</a>
            </td>
          </tr>          
        </ContentTemplate>
      </asp:RoleGroup>
      <asp:RoleGroup Roles="Customers">
        <ContentTemplate>
          <tr>
            <td class="UserInfoHead">
              <asp:LoginName ID="LoginName2" runat="server" FormatString="Здравей, <b>{0}</b>!" />
            </td>
          </tr>            
          <tr>
            <td class="UserInfoContent">  
              <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutText="Изход" LoginText="Вход" />
              <br />
              <asp:HyperLink runat="server" ID="detailsLink"
                NavigateUrl="~/CustomerDetails.aspx"
                Text="Редактирай детайли"
                ToolTip="Edit your personal details" />
          </td>
        </ContentTemplate>
      </asp:RoleGroup>
    </RoleGroups>
  </asp:LoginView>
</table>
