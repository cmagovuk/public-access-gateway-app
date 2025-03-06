class ResubmitController < ApplicationController
    
    def list
        @submissions = Submission.where("referencenumber IS NOT NULL AND status='summary'").order(updated_at: :desc).first(500)

        
    end

    def view
        
        if !params[:id].nil?
            @submission = Submission.find(params[:id])
        end
        
        if !params[:reference_number].nil?
            @submission = Submission.where("referencenumber = :ref_num",ref_num: params["reference_number"] )
        end        

    end

    def submit

        @submission = Submission.find(params[:submission][:id])

        Transmitter.Transmit(@submission)

    end

end
