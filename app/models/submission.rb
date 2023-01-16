class Submission < ApplicationRecord

    has_many :businesses
    has_many_attached :evidencefiles

    # serialize :nation, Array

    # validates_associated :businesses

    CLASSIFY_OPTIONS = %w[business sector cartels ongoing whistleblowing more other].freeze

    NATION_OPTIONS = %w[england scotland ni wales notuk unknown].freeze

    EMAIL_REGEX = /\A(?!\.)("([^"\r\\]|\\["\r\\])*"|([-a-zA-Z0-9!#$%&'*+\/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)@[a-zA-Z0-9][\w.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z.]*[a-zA-Z]\z/.freeze
  
    validate :validate_nation      
    validate :validate_businesses
    validate :validate_description
    
    validate :validate_relatedreferencenumber
    validate :validate_relatedinvestigation

    validates :classification, presence: { if: ->(o) { o.status.to_sym == :classify }}, length: { maximum: 255 }, allow_blank:false, on: :update

    validates :contactfirstname, presence: { if: ->(o) { o.status.to_sym == :contact }}, length: { maximum: 255 }, allow_blank:true, on: :update
    validates :contactlastname, presence: { if: ->(o) { o.status.to_sym == :contact }}, length: { maximum: 255 }, allow_blank:true, on: :update
    validates :contactemail, presence: { if: ->(o) { o.status.to_sym == :contact }}, length: { maximum: 255 }, allow_blank:true, format: { with: EMAIL_REGEX }, on: :update
    validates :contacttelephone, presence: { if: ->(o) { o.status.to_sym == :contact }}, length: { maximum: 20 }, allow_blank:true, format: { with: /\A(?:\+?|\b)[0-9 \-()]{5,}\b\z/ }, on: :update
    

    def validate_relatedreferencenumber
      if status.to_sym == :related_reference_number
        if !relatedreferencenumber.match(/\A(CMA|CMAE)[0-9\-]+\z/) and !relatedreferencenumber.blank?
          errors.add(:relatedreferencenumber,:format)
        end
      end
    end

    def validate_relatedinvestigation
      if status.to_sym == :related_investigation
        # removing this validation because it is not needed
        #if relatedinvestigation.blank?
        #  errors.add(:relatedinvestigation,:blank)
        #end
        if relatedinvestigation.length > 255
          errors.add(:relatedinvestigation,:too_long,{count: 255})
        end
      end
    end

    def validate_description
      if [:what_happened,:additional_information].include? status.to_sym
        if description.length > 3500
          errors.add(:description,:too_long,{count: 3500} )
        end
        if description.blank?
          errors.add(:description,:blank)
        end
      end
    end

    def validate_nation
      if status.to_sym == :nation and nation.blank?
        errors.add(:nation, :blank)
      end
    end

    def validate_businesses
      if (status.to_sym == :businesses && classification.to_sym == :business) and (businesses.length == 0)
        errors.add(:businesses, :blank)
      end
    end

    CONTENT_TYPES_ALLOWED = %w[
      text/plain
      application/pdf
      image/jpeg
      image/png
      video/mp4
      video/quicktime
      video/x-ms-wmv
      application/msword
      application/vnd.ms-excel
      application/vnd.ms-powerpoint
      application/vnd.openxmlformats-officedocument.wordprocessingml.document
      application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
      application/vnd.openxmlformats-officedocument.presentationml.presentation
    ].freeze
  
    FILE_SIZE_LIMIT = 10.megabytes
    MAXIMUM_FILE_UPLOADS = 5
    
    def valid_file?(f)
      @valid_file ||= !too_many_files? && valid_file_size?(f) && valid_file_type?(f) && non_empty_file?(f) && file_unique?(f)
    end
  
    def self.Purge!(date)
      where(
        "submissions.created_at <= :date", date: date
      ).where(
        "submissions.updated_at <= :date", date: 45.minutes.ago
      ).destroy_all
    end

  private
  
    def valid_file_size?(f)
      return true if f.size <= FILE_SIZE_LIMIT
  
      errors.add(
        :evidencefiles,
        I18n.t(
          "errors.upload.file_size_error_message",
          filename: document.original_filename,
          size_limit: ActiveSupport::NumberHelper.number_to_human_size(FILE_SIZE_LIMIT),
        ),
      )
      false
    end
  
    def non_empty_file?(f)
      return true unless f.size.zero?
  
      errors.add(
        :evidencefiles,
        I18n.t("errors.upload.empty_file_error_message"),
      )
      false
    end
  
    def too_many_files?
      return false unless evidencefiles.count >= MAXIMUM_FILE_UPLOADS
  
      errors.add(:evidencefiles, I18n.t("errors.upload.too_many_files_error_message", file_uploads: MAXIMUM_FILE_UPLOADS))
      true
    end
  
    def valid_file_type?(f)
      return true if CONTENT_TYPES_ALLOWED.include?(f.content_type)
      errors.add(:evidencefiles, I18n.t("errors.upload.file_type_error_message", filename: f.original_filename))
      false
    end
  
    def file_unique?(f)
      files = evidencefiles.select {|att| att.filename == f.original_filename}
      if files.length > 0
        errors.add(:evidencefiles, I18n.t("errors.upload.file_unique_error_message", filename: f.original_filename))
        return false
      else
        return true
      end
    end

end
