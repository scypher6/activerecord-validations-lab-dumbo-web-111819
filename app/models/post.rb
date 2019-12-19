class Post < ActiveRecord::Base
    #include ActiveModel::Validations
    #validates_with  PostValidator

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :bait_validator


    CLICKBAIT_TERMS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    def bait_validator
        if CLICKBAIT_TERMS.none? {|term| term.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end
