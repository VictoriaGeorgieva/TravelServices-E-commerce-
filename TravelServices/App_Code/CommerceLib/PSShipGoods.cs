namespace CommerceLib
{
  /// <summary>
  /// 6th pipeline stage – used to send a notification email to
  /// the supplier, stating that goods can be shipped
  /// </summary>

  public class PSShipGoods : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("Доставка на продуктите започва.", 20500);
      try
      {
        // send mail to supplier
        orderProcessor.MailSupplier("Доставка на фактура.",
          GetMailBody());
        // audit
        orderProcessor.CreateAudit(
          "Изпращане на писмо до доставчик за доставкат на фактура за продуктите.", 20502);
        // update order status
        orderProcessor.Order.UpdateStatus(6);
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Грешка при изпращане на съобщение към доставчик.", 5);
      }
      // audit
      processor.CreateAudit("Доставка на продуктите приключи.", 20501);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail =
        "Беше получено плащане за следните продукти:\n\n"
        + orderProcessor.Order.OrderAsString
        + "\n\nМоля изпратете фактура до:\n\n"
        + orderProcessor.Order.CustomerAddressAsString
        + "\n\nКогато фактурата за продуктите бъде изпратена, моля потвърдете чрез: "
        + "http://www.example.com/AdminOrders.aspx"
        + "\n\nНомер на поръчката:\n\n"
        + orderProcessor.Order.OrderID.ToString();
      return mail;
    }
  }
}
