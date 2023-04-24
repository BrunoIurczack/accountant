module ApplicationHelper
  def paid_status_switcher(payment)
    payment.paid ? (link_to t('Positivo'), change_status_payment_path(payment), class:"btn btn-success") : (link_to t("negativo"), change_status_payment_path(payment), class:"btn btn-danger")
  end
end