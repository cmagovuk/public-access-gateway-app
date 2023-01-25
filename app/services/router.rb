class Router

    Routes = {
        :business       => [:classify, :businesses, :what_happened, :evidence, :contact, :review, :summary],
        :sector         => [:classify, :what_happened, :evidence, :contact, :review, :summary],
        :more           => [:classify, :related_reference_number, :what_happened, :evidence, :contact, :review, :summary],
        :ongoing        => [:classify, :related_investigation, :what_happened, :evidence, :contact, :review, :summary],
        :cartels        => [:classify, :cartels],
        :whistleblowing => [:classify, :whistleblowing],
        :other          => [:classify, :businesses, :what_happened, :evidence, :contact, :review, :summary]
    }.freeze

    def self.Route(classification)
        return Routes[classification]
    end

    def self.Contains(classification,step)
        if Routes[classification].include? step
            return true
        else
            return false
        end
    end

    def self.PreviousSteps(classification,step)
        steps = Routes[classification]
        i = steps.find_index(step)
        if (!i.nil?)
            return Routes[classification][0,i+1]
        else
            return nil
        end
    end

    def self.NextSteps(classification,step)
        steps = Routes[classification]
        i = steps.find_index(step)
        if !steps.nil?
            if Routes[classification].length > i+1
                return Routes[classification][i+1,Routes[classification].length]
            else
                return nil
            end
        else
            return nil
        end
    end

    def self.Next(classification,step)
        steps = Routes[classification]
        i = steps.find_index(step)
        if !i.nil?
            if Routes[classification].length > i+1
                return Routes[classification][i+1]
            else
                return nil
            end
        else
            return nil
        end
    end

    def self.Previous(classification,step)
        steps = Routes[classification]
        i = steps.find_index(step)
        if !i.nil?
            if i>0
                return Routes[classification][i-1]
            else
                return nil
            end
        else
            return nil
        end
    end




end
