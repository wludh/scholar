class CopyrightMailer < ActionMailer::Base
  def copyright_email(user, work, document)
    from = SMTP_SETTINGS['from_email'] if SMTP_SETTINGS
    #from ||= $NO_REPLY_EMAIL || 'bibapp-noreply@bibapp.org'
    @user = user
    @work = work
    @document = document
    if @document.respond_to?(:read)
     attachments[@document.original_filename] = @document.read
    elsif @document.respond_to?(:path)
      attachments[@document.original_filename] = File.read(@document.path)
    else
     puts "Contact Sys Admin for help."
    end
    mail(to: 'digitalarchive@wlu.edu', subject: 'Author interested in archiving their work through BibApp.', from: from)
  end
end
