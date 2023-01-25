class WizardController < ApplicationController
    before_action :load_submission

    SERVICE_REVIEW_URL_ENV = "SERVICE_REVIEW_URL".freeze

    # if no wizard URL is passed, force redirection to the service homepage URL
    def service_homepage
        redirect_to ENV['SERVICE_HOMEPAGE_URL'] and return
    end

    # Render the start page
    def start
        reset_session
    end

    # React to submission of the start page
    def start_submit
        @submission = Submission.new(:status => :start)
        
        if @submission.save
            session[:submission_id] = @submission.id
            redirect_to :controller => :wizard, :action => :classify and return
        else
            render :start and return
        end
    end

    # Render the classify page
    def classify
        @submission.status = :classify
    end

    # React to submission of the classify page
    def classify_submit
        if @submission.update(params.require(:submission).permit(:status,:classification))
            session[:review_reached] = nil
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :classify and return
        end
    end

    # Render the Related Reference Number page
    def related_reference_number
        check_route(:related_reference_number) or return
    end

    # React to submission of the Related Reference Number page
    def related_reference_number_submit

        # if related reference number has a suffix, strip it
        # e.g. CMA22000123-1  or CMAE22000123-1
        
        attributes = params.clone()
        
        i = attributes[:submission][:relatedreferencenumber].index('-')

        if !i.nil?
            attributes[:submission][:relatedreferencenumber] = attributes[:submission][:relatedreferencenumber][0,i]
        end

        if @submission.update(attributes.require(:submission).permit(:status,:relatedreferencenumber))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :related_reference_number and return
        end
    end

    # Render the Related Investigation page
    def related_investigation
        check_route(:related_investigation) or return
    end

    # React to submission of the related investigation page
    def related_investigation_submit
        if @submission.update(params.require(:submission).permit(:status,:relatedinvestigation))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :related_investigation and return
        end
    end

    # Render the "What Happened" page
    def what_happened
        check_route(:what_happened) or return
    end

    # React to submission of the "What Happened" page
    def what_happened_submit
        if @submission.update(params.require(:submission).permit(:status,:description))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :what_happened and return
        end
    end

    # Render the "Additional Information" page
    def additional_information
        check_route(:additional_information) or return
    end

    # React to submission of the "Additional Information" page
    def additional_information_submit
        if @submission.update(params.require(:submission).permit(:status,:description))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :additional_information and return
        end
    end

    # Render the "Businesses" page
    def businesses
        check_route(:businesses) or return
        @businesses = Business.where(submission_id: @submission.id)
    end

    # React to submission of the "Businesses" page
    def businesses_submit
        if @submission.update(params.require(:submission).permit(:status))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            @businesses = Business.where(submission_id: @submission.id)
            render :businesses and return
        end
    end

    # Render the Business Add form
    def business_add
        @business = @submission.businesses.new
    end

    # React to submission of the Business Add form
    def business_add_submit
        @business = @submission.businesses.new(params.require(:business).permit(:submission_id, :name, :street, :townorcity, :county, :postcode, :url))
        if @business.save
            redirect_to :controller => :wizard, :action => :businesses and return
        else            
            render :business_add and return
        end
    end

    # Render the Business Edit form
    def business_edit
        @business = @submission.businesses.where(id: params[:business_id]).first
    end

    # React to submission of the Business Edit form
    def business_edit_submit
        @business = @submission.businesses.where(id: params[:business][:id]).first
        if @business.update(params.require(:business).permit(:submission_id, :id, :name, :street, :townorcity, :county, :postcode, :url))
            redirect_to :controller => :wizard, :action => :businesses and return
        else
            render :business_edit and return
        end
    end

    # React to submission of the Business Remove link
    def business_remove
        @business = @submission.businesses.where(id: params[:business_id]).first
        if !@business.nil?
            @business.destroy
        end
        redirect_to :controller => :wizard, :action => :businesses, :method => 'GET' and return
    end

    # Render the Evidence page
    def evidence
        check_route(:evidence) or return
    end

    # React to upload of evidence on the Evidence page
    def evidence_upload
        if !params[:submission].nil?
            if @submission.valid_file?(params[:submission][:evidencefiles])
                @submission.evidencefiles.attach(params[:submission][:evidencefiles])
                redirect_to :controller => :wizard, :action => :evidence and return
            else
                render :evidence and return
            end
        else
            @submission.errors.add(:evidencefiles, I18n.t("errors.upload.no_file_error_message"))
            render :evidence and return
        end
    end

    # React to removing evidence on the Evidence page
    def evidence_remove
        @evidence = @submission.evidencefiles.where(id: params[:evidence_id]).first
        if !@evidence.nil?
            @evidence.purge
            redirect_to :controller => :wizard, :action => :evidence and return
        else
            render :evidence and return
        end
    end

    # React to submission of the evidence page
    def evidence_submit
        if @submission.update(params.require(:submission).permit(:status))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :evidence and return
        end
    end

    # Render the nation page
    def nation
        check_route(:nation) or return
    end

    # React to submission of the nation page
    def nation_submit
        if @submission.update(params.require(:submission).permit(:status,:nation))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :nation and return
        end
    end

    # Render the contact page
    def contact
        check_route(:contact) or return
    end

    # React to submission of the contact page
    def contact_submit
        if @submission.update(params.require(:submission).permit(:status,:contactfirstname, :contactlastname, :contactemail, :contacttelephone, :nation))
            redirect_to :controller => :wizard, :action => next_step() and return
        else
            render :contact and return
        end
    end

    # Render the review page
    def review
        check_route(:review) or return
        session[:review_reached] = true
    end

    # React to submission of the review page
    def review_submit

        if @submission.referencenumber.blank?

            @submission.transmission = Transmitter.BuildJSON(@submission)

            # if the relatedreferencenumber is not blank USE IT else make a new reference number
            if @submission.relatedreferencenumber.blank?

                # relatedreferencenumber is blank - so generate a new reference number

                year = Time.now.utc.year
                if ([1,2,3].include? Time.now.utc.month)
                    year = Time.now.utc.year - 1
                end
                
                max_count = Submission.where("referencenumberyear = " + year.to_s).maximum("referencenumbercount")
                if (max_count.nil?)
                    max_count = 0
                end

                @submission.referencenumberyear = year
                @submission.referencenumbercount = max_count + 1
                @submission.referencenumber = "CMAE" + year.to_s[2,2] + (max_count+1).to_s.rjust(5,"0")

            else

                # relatedreferencenumber is NOT blank - so generate a temporary reference number
                # format... REL-CMA2200012-1-1234
                @submission.referencenumber = "REL-" + @submission.relatedreferencenumber + "-" + Submission.all.count.to_s

                # @submission.referencenumber = @submission.relatedreferencenumber
            
            end

            # update the submission and redirect appropriately

            if @submission.update(params.require(:submission).permit(:referencenumber,:referencenumberyear,:referencenumbercount,:transmission))
                    
                response = Transmitter.Transmit(@submission)

                Notifier.Send(@submission) if @submission.contactemail.present?

                redirect_to :controller => :wizard, :action => :summary and return
            else
                redirect_to :controller => :wizard, :action => :error and return
            end

        else
            redirect_to :controller => :wizard, :action => :summary and return
        end
        return

    end

    
    # Render the Cartels page
    def cartels
        check_route(:cartels) or return
    end

    # Render the Whistleblowing page
    def whistleblowing
        check_route(:whistleblowing) or return
    end


    # Render the Summary page
    def summary
        check_route(:summary) or return
        session[:summary_reached] = true
        
        @service_review_url = ENV.fetch(SERVICE_REVIEW_URL_ENV)
    end

    # Render the error page
    def error
    end

    # Render a PDF (not implemented fully yet)
    def pdf

        pdf = Prawn::Document.new
        pdf.text "Hello World"
        send_data pdf.render, :filename => "test.pdf"
        
        #respond_to do |format|
        #    format.pdf do
        #        pdf = Prawn::Document.new
        #        pdf.text "Hello World"
        #        send_data pdf.render
        #    end
        #end
    end

    # Render the print page
    def print
    end


private

    # all wizard controller methods try to load the submission if it exists
    def load_submission
        @submission = Submission.find(session[:submission_id])
    rescue
        @submission = nil
    end


    # When pages of the wizard post their contents to the controller, this method is used in the redirect action
    # to choose the next page to show. It calls Router.Next to find out the next page, based on the classification and
    # status of the submission (which reflects the current step).
    def next_step()
        if session[:review_reached].nil? || (@submission.status.to_sym == :classify)
            return Router.Next(@submission.classification.to_sym, @submission.status.to_sym)
        else
            if session[:summary_reached].nil?
                return :review
            else
                return :summary
            end
        end
    end

    # Gets called when the wizard controller arrives at a new step to check if the step is actually allowed.
    # only the next step or previous steps are allowed
    def check_route(step)
        
        # only check the route if we have not reached summary
        if session[:summary_reached].nil?

            # get the next step based on the current status
            next_step_for_status = Router.Next(@submission.classification.to_sym, @submission.status.to_sym)        
            
            # get the previous steps based on the current status
            previous_steps_for_status = Router.PreviousSteps(@submission.classification.to_sym, @submission.status.to_sym)
            
            # if the next step is not nil, or the previous steps are not nil...
            if !next_step_for_status.nil? or !previous_steps_for_status.nil?

                # if the requested step is the next step, or is in the previous steps, allow it                
                if next_step_for_status == step or previous_steps_for_status.include? step

                    @submission.status = step
                    @submission.save(:validate => false)

                elsif !session[:review_reached].nil? && step == :review
                    
                    # if review_reached is not nil, and step is review, allow it

                else
                    
                    # if review reached is not nil force redirection back to review, else go to current status
                    if !session[:review_reached].nil?
                        # redirect to review
                        redirect_to :controller => :wizard, :action => :review and return
                    else
                        # redirect to current status
                        redirect_to :controller => :wizard, :action => @submission.status.to_sym and return
                    end

                end

            else

                # its not the next step, or a previous step - so redirect to the current step
                redirect_to :controller => :wizard, :action => @submission.status.to_sym and return

            end

        else
            
            # summary reached is NOT nil - so we have reached it

            # if the requested step is not the summary step, force a redirection
            if step.to_sym != :summary
                redirect_to :controller => :wizard, :action => :summary and return
            end

        end

        # ensure we always return a value for the "or return" logic
        return true

    end
    

    

end