
class Notifier < ActionMailer::Base
  
  
  # use this when an inquiry comes from the contact us page.
  # was shipped
  def inquiry(comment)
    @subject = "Penz by Design Inquiry"
    @body       = {:comment => comment}
    @recipients = "stacy.penz@gmail.com" #"elmoakmaple@yahoo.com" #
    @bcc        = ''
    @from       = "orders@penzbydesign.com"
    @sent_on    = Time.now.utc
    @headers    = {}
  end
  
end
