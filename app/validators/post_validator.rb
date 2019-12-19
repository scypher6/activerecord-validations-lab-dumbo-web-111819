class PostValidator < ActiveModel::PostValidator

    CLICKBAIT_TERMS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    def bait_validator
        if CLICKBAIT_TERMS.none? {|term| term.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end


