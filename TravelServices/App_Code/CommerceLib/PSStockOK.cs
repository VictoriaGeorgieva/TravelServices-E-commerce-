namespace CommerceLib
{
  /// <summary>
  /// Summary description for PSStockOK
  /// </summary>
  public class PSStockOK : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("Потвърждение на стоката започна.", 20300);
      // the method is called when the supplier confirms that stock is 
      // available, so we don't have to do anything here except audit
      orderProcessor.CreateAudit("Стоката е потвърдена от доставчик.",
        20302);
      // update order status
      orderProcessor.Order.UpdateStatus(4);
      // continue processing
      orderProcessor.ContinueNow = true;
      // audit
      processor.CreateAudit("Потвърждение на стоката приключи.", 20301);
    }
  }
}
