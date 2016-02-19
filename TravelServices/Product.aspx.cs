using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class Product : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    // Retrieve ProductID from the query string
    string productId = Request.QueryString["ProductID"];
    // Retrieves product details
    ProductDetails pd = CatalogAccess.GetProductDetails(productId);
    // Does the product exist?
    if (pd.Name != null)
    {
      PopulateControls(pd);
    }
    else
    {
      Server.Transfer("~/NotFound.aspx");
    }
    // 301 redirect to the proper URL if necessary
    Link.CheckProductUrl(Request.QueryString["ProductID"]);

    startDate.SelectionChanged += new EventHandler(this.Selection_Change);
  }

  void Selection_Change(Object sender, EventArgs e)
  {
      foreach(DateTime day in startDate.SelectedDates)
      {          
          string justNumberOfDays = daysLabel.Text.Substring(0, daysLabel.Text.IndexOf(" ") + 1);
          DateTime endDateNew = day.AddDays(int.Parse(justNumberOfDays));
          endDate.Text = endDateNew.Date.ToShortDateString() + "<br />";

          foreach (Control contr in attrPlaceHolder.Controls)
          {
              if (contr is DropDownList)
              {
                  int selectedIndex = (((DropDownList)contr).SelectedIndex + 1);
                  decimal priceToShow = getTotalPrice(selectedIndex);
                  TotalPrice.Text = String.Format(new System.Globalization.CultureInfo("bg-BG"), "{0:C}", priceToShow);
                  //setTotalPrice(selectedIndex);
              }
          }
      }
  }

  protected void DayRender(object sender, DayRenderEventArgs e)
  {
      string productId = Request.QueryString["ProductID"];
      ProductDetails pd = CatalogAccess.GetProductDetails(productId);

      DateTime fromDate = Convert.ToDateTime(pd.AvailableFrom);
      DateTime toDate = Convert.ToDateTime(pd.AvailableTo);

      string justNumberOfDays = daysLabel.Text.Substring(0, daysLabel.Text.IndexOf(" ") + 1);
      DateTime endDateNew = toDate.AddDays((int.Parse(justNumberOfDays) * -1));

      if (e.Day.Date < fromDate || e.Day.Date > endDateNew)
      {
          e.Day.IsSelectable = false;
          e.Cell.ForeColor = System.Drawing.Color.Gray;
      }
  }

  // Fill the control with data
  private void PopulateControls(ProductDetails pd)
  {
    // Display product recommendations
    string productId = pd.ProductID.ToString();
    recommendations.LoadProductRecommendations(productId);
    // Display product details
    titleLabel.Text = pd.Name;
    descriptionLabel.Text = pd.Description;
    priceLabel.Text = String.Format(new System.Globalization.CultureInfo("bg-BG"), "{0:C}", pd.Price);
    TotalPrice.Text = String.Format(new System.Globalization.CultureInfo("bg-BG"), "{0:C}", pd.Price);
    daysLabel.Text = String.Format("{0} дни", pd.Days);
    availableFrom.Text = String.Format("{0}", pd.AvailableFrom);
    availableTo.Text = String.Format("{0}", pd.AvailableTo);
    
    productImage.ImageUrl = Link.ToProductImage(pd.Image);
    // Set the title of the page
    this.Title = BalloonShopConfiguration.SiteName + ": " + pd.Name;

    // obtain the attributes of the product
    DataTable attrTable = CatalogAccess.GetProductAttributes(pd.ProductID.ToString());

    // temp variables
    string prevAttributeName = "";
    string attributeName, attributeValue, attributeValueId;

    // current DropDown for attribute values
    Label attributeNameLabel;    
    DropDownList attributeValuesDropDown = new DropDownList();
    // read the list of attributes
    foreach (DataRow r in attrTable.Rows)
    {
      // get attribute data
      attributeName = r["AttributeName"].ToString();
      attributeValue = r["AttributeValue"].ToString();
      attributeValueId = r["AttributeValueID"].ToString();

      // if starting a new attribute (e.g. Color, Size)
      if (attributeName != prevAttributeName)
      {
        prevAttributeName = attributeName;
        attributeNameLabel = new Label();
        attributeNameLabel.Text = attributeName + ": ";
        attributeValuesDropDown = new DropDownList();
        attrPlaceHolder.Controls.Add(attributeNameLabel);
        attrPlaceHolder.Controls.Add(attributeValuesDropDown);
      }

      // add a new attribute value to the DropDownList
      attributeValuesDropDown.Items.Add(new ListItem(attributeValue, attributeValueId));
    }

    foreach (Control contr in attrPlaceHolder.Controls)
    {
        if (contr is DropDownList)
        {
            ((DropDownList)contr).SelectedIndexChanged += new EventHandler(this.NumberOfPeopleChanged);
            ((DropDownList)contr).AutoPostBack = true;
            ((DropDownList)contr).AppendDataBoundItems = false;
        }
    }

    //calendar set default values
    startDate.SelectedDate = Convert.ToDateTime(pd.AvailableFrom);
    startDate.VisibleDate = Convert.ToDateTime(pd.AvailableFrom);

    string justNumberOfDays = daysLabel.Text.Substring(0, daysLabel.Text.IndexOf(" ") + 1);
    DateTime endDateNew = Convert.ToDateTime(pd.AvailableFrom).AddDays(int.Parse(justNumberOfDays));
    endDate.Text = endDateNew.Date.ToShortDateString() + "<br />";
  }

  decimal getTotalPrice(int selectedIndex)
  {
      string productId = Request.QueryString["ProductID"];
      ProductDetails pd = CatalogAccess.GetProductDetails(productId);

      decimal price = (decimal)0.0;

      switch (selectedIndex)
      {
          case 6:
              price = (decimal)2.5 * pd.Price;
              break;
          case 7:
              price = 3 * pd.Price;
              break;
          case 8:
              price = 5 * pd.Price;
              break;
          default:
              price = selectedIndex * pd.Price;
              break;
      }
      return price;
      //TotalPrice.Text = String.Format(new System.Globalization.CultureInfo("bg-BG"), "{0:C}", price);
  }

  void NumberOfPeopleChanged(Object sender, EventArgs e) 
  {
      int selectedIndex = (((DropDownList)sender).SelectedIndex + 1);
      decimal priceToShow = getTotalPrice(selectedIndex);
      TotalPrice.Text = String.Format(new System.Globalization.CultureInfo("bg-BG"), "{0:C}", priceToShow);
  }

  protected void AddToCartButton_Click(object sender, EventArgs e)
  {
    // Retrieve ProductID from the query string
    string productId = Request.QueryString["ProductID"];

    // Retrieve the selected product options
    string options = "";
    int selectedIndex = 0;

    foreach (Control cnt in attrPlaceHolder.Controls)
    {
      if (cnt is Label)
      {
        Label attrLabel = (Label)cnt;
        options += attrLabel.Text;
      }

      if (cnt is DropDownList)
      {
        DropDownList attrDropDown = (DropDownList)cnt;
        options += attrDropDown.Items[attrDropDown.SelectedIndex] + "; ";
        selectedIndex = (((DropDownList)cnt).SelectedIndex + 1);
      }
    }

    string endDayToSend = "";
    foreach (DateTime day in startDate.SelectedDates)
    {
        string justNumberOfDays = daysLabel.Text.Substring(0, daysLabel.Text.IndexOf(" ") + 1);
        DateTime endDateNew = day.AddDays(int.Parse(justNumberOfDays));
        endDayToSend = endDateNew.Date.ToShortDateString();
    }

    // Add the product to the shopping cart
    ShoppingCartAccess.AddItem(productId, getTotalPrice(selectedIndex).ToString(), startDate.SelectedDate.ToShortDateString(), endDayToSend, options);
  }
}
