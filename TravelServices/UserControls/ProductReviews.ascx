﻿<%@ Control Language="C#" AutoEventWireup="true" 
CodeFile="ProductReviews.ascx.cs" Inherits="UserControls_ProductReviews"%>

<p class="ReviewHead">Потребителски отзиви</p>

<asp:DataList ID="list" runat="server" ShowFooter="true" 
CssClass="ReviewTable">
  <ItemStyle CssClass="ReviewTable" />
  <ItemTemplate>
    <p>
      Автор: <strong>
        <%# Eval("CustomerName") %></strong> on
      <%# String.Format("{0:D}", Eval("ReviewDate")) %>:
      <br />
      <i>
        <%# Eval("ProductReview") %></i>
    </p>
  </ItemTemplate>
  <FooterTemplate>
  </FooterTemplate>
</asp:DataList>

<asp:Panel ID="addReviewPanel" runat="server">
  <p>
    Напишете свой коментар!</p>
  <p>
    <asp:TextBox runat="server" ID="reviewTextBox" Rows="3" 
      Columns="88" TextMode="MultiLine" />
  </p>
  <asp:LinkButton ID="addReviewButton" runat="server" 
    OnClick="addReviewButton_Click">Добави коментар</asp:LinkButton>
</asp:Panel>

<asp:LoginView ID="LoginView1" runat="server">
  <AnonymousTemplate>
    <p>
      Влезте в профила си за да напишете свой собствен коментар.</p>
  </AnonymousTemplate>
</asp:LoginView>
