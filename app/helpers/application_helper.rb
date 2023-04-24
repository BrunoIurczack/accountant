module ApplicationHelper
  def paid_status_switcher(payment, position)
    path = change_status_payment_path(payment)
    path = change_status_from_customer_customer_payment_path(payment) if position == 'show_customer'
    
    if payment.paid? 
      link_to t('Positivo'), path, class:"btn btn-success"
    else
      link_to t("negativo"), path, class:"btn btn-danger"
    end
    
  end
end