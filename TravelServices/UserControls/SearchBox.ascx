<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchBox.ascx.cs" Inherits="UserControls_SearchBox" %>
<asp:Panel ID="searchPanel" runat="server" DefaultButton="goButton">
  <table class="SearchBox">
    <tr>
      <td class="SearchBoxHead">Търсене</td>
    </tr>
    <tr>
      <td class="SearchBoxContent">
        <asp:TextBox ID="searchTextBox" Runat="server" Width="125px" 
          MaxLength="100" />
        <asp:Button ID="goButton" Runat="server" 
          Text="Търси" Width="50px" onclick="goButton_Click" /><br />
        <asp:CheckBox ID="allWordsCheckBox" Runat="server" 
          Text="Търси всички думи" />
      </td>
    </tr>
  </table>
</asp:Panel> 
