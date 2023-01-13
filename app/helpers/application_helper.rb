module ApplicationHelper
  def service_name
    t("service.name")
  end

  def analytics_tracking_id
    Rails.application.config.x.analytics_tracking_id
  end

  def link_info_charter
    Rails.application.config.x.link_info_charter
  end

  def link_start_page
    Rails.application.config.x.link_start_page
  end

  def title(page_title)
    content_for :page_title, [page_title.presence, service_name, "GOV.UK"].compact.join(" - ")
  end

  def feedback_link(name)
    if Rails.application.config.x.feedback_email.present?
      html_options = {
        class: "govuk-link govuk-link--no-visited-state",
      }
      subject = t "feedback.subject"
      href = "mailto:#{Rails.application.config.x.feedback_email}?Subject=""#{subject}"""
      link_to name, href, html_options
    else
      name
    end
  end

  def path_only(url)
    return nil if url.nil?

    URI.parse(url).tap { |uri|
      uri.host = nil
      uri.port = nil
      uri.scheme = nil
    }.to_s
  end
end
