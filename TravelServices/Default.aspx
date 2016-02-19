<%@ Page Title="Сайт за екскурзионни услуги в чужбина" Language="C#" MasterPageFile="~/BalloonShop.master" %>

<%@ Register src="UserControls/ProductsList.ascx" tagname="ProductsList" tagprefix="uc1" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    <span class="CatalogTitle">Добре дошли в сайта за екскурзионни услуги в чужбина</span>
  </h1>
  <uc1:ProductsList ID="ProductsList1" runat="server" />
</asp:Content>


