using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommerceLib
{
  /// <summary>
  /// Summary description for PSDummy
  /// </summary>
  public class PSDummy : IPipelineSection
  {
    public void Process(OrderProcessor processor)
    {
      processor.CreateAudit("Нищо започнато.", 99999);
      processor.CreateAudit("Клиент: "
        + processor.Order.Customer.UserName, 99999);
      processor.CreateAudit("Първи продукт в поръчката: "
        + processor.Order.OrderDetails[0].ItemAsString, 99999);
      processor.MailAdmin("Тест.", "Тестово съобщение.", 99999);
      processor.CreateAudit("Нищ приключено.", 99999);
    }
  }
}
