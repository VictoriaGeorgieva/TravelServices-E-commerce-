namespace CommerceLib
{
  /// <summary>
  /// 3rd pipeline stage – used to send a notification email to
  /// the supplier, asking whether goods are available
  /// </summary>
  public class PSCheckStock : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("Проверка на наличностите на склада започна.", 20200);

      try
      {
        // send mail to supplier
        orderProcessor.MailSupplier("Сайт за екскурзионни услуги - проверка на наличности.",
          GetMailBody());

        // audit
        orderProcessor.CreateAudit(
          "Известието е изпратено към ел. поща на доставчик.", 20202);
        // update order status
        orderProcessor.Order.UpdateStatus(3);
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Грешка при изпращане на съобщение към доставчик.", 2);
      }
      // audit
      processor.CreateAudit("Проверка на наличностите на склада приключи.", 20201);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail = 
        "Следните продукти бяха поръчани:\n\n"
        + orderProcessor.Order.OrderAsString
        + "\n\nМоля проверете наличностите за: "
        + "http://www.example.com/AdminOrders.aspx"
        + "\n\nНомер на поръчката:\n\n"
        + orderProcessor.Order.OrderID.ToString();
      return mail;
    }
  }
}
